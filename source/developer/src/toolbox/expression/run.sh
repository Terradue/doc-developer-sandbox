#!/bin/bash

# source the ciop functions (e.g. ciop-log, ciop-getparam)
source ${ciop_job_include}

# set the environment variables to use ESA BEAM toolbox
export BEAM_HOME=$_CIOP_APPLICATION_PATH/share/beam-4.11
export PATH=$BEAM_HOME/bin:$PATH

# define the exit codes
SUCCESS=0
ERR_BEAM=2
ERR_NOEXPR=3
ERR_NOINPUT=4

# add a trap to exit gracefully
function cleanExit ()
{
   local retval=$?
   local msg=""
   case "$retval" in
     $SUCCESS)     msg="Processing successfully concluded";;
     $ERR_BEAM)    msg="Beam_expr failed to process product `basename $product`";;
     $ERR_NOEXPR)  msg="No expression provided";;
     $ERR_NOINPUT) msg="No input provided";;
     *)            msg="Unknown error";;
   esac
   [ "$retval" != "0" ] && ciop-log "ERROR" "Error $retval - $msg, processing aborted" || ciop-log "INFO" "$msg"
   exit $retval
}

trap cleanExit EXIT

# create the output folder to store the output products and export it
mkdir -p $TMPDIR/output
export OUTPUTDIR=$TMPDIR/output

# band arithmetic expression for ESA BEAM Toolbox
expression="l1_flags.INVALID?0:radiance_13>17?0:100+radiance_9-(radiance_8+(radiance_10-radiance_8)*27.524/72.570)"

# log the value, it helps debugging. 
# the log entry is available in the process stderr 
ciop-log "DEBUG" "The expression used is: $expression"

# Loops over all inputs
while read inputfile 
do
	# report activity in log
	ciop-log "INFO" "Retrieving $inputfile from storage"

	# retrieve the MER_RR__1P product to the local temporary folder TMPDIR provided by the framework (this folder is only used by this process)
	# the ciop-copy utility will use one of online resource available in the metadata to copy it to the TMPDIR folder
	# the utility returns the local path so the variable $retrieved contains the local path to the MERIS product
	retrieved=`ciop-copy -o $TMPDIR "$inputfile"`
	outputname=`basename $retrieved`

	# check if the file was retrieved, if not exit with the error code $ERR_NOINPUT
	[ "$?" == "0" -a -e "$retrieved" ] || exit $ERR_NOINPUT

	# report activity in the log
	ciop-log "INFO" "Retrieved `basename $retrieved`, moving on to expression"

	# prepare the BEAM request
	BEAM_REQUEST=/tmp/`uuidgen`.xml

cat << EOF > $BEAM_REQUEST
<?xml version="1.0" encoding="UTF-8"?>
<graph>
  <version>1.0</version>
  <node id="1">
    <operator>Read</operator>
      <parameters>
        <file>$retrieved</file>
      </parameters>
  </node>
  <node id="2">
    <operator>BandMaths</operator>
    <sources>
      <source>1</source>
    </sources>
    <parameters>
      <targetBands>
        <targetBand>
          <name>out</name>
          <expression>$expression</expression>
          <description>Processed Band</description>
          <type>float32</type>
        </targetBand>
      </targetBands>
    </parameters>
  </node>
  <node id="write">
    <operator>Write</operator>
    <sources>
       <source>2</source>
    </sources>
    <parameters>
      <file>$OUTPUTDIR/$outputname</file>
   </parameters>
  </node>
</graph>
EOF

	# invoke the ESA BEAM toolbox
	gpt.sh $BEAM_REQUEST &> /dev/null

	# check the exit code
	[ "$?" != "0" ] && exit $ERR_BEAM

	# compress the ESA BEAM results
	outputname=`echo $(basename $retrieved)`.dim
	outputfolder=`echo $(basename $retrieved)`.data
	tar cfz $OUTPUTDIR/$outputname.tgz $OUTPUTDIR/$outputname $OUTPUTDIR/$outputfolder &> /dev/null
	
	# publish the compressed results
	ciop-log "INFO" "Publishing $outputname.dim and $outputname.data" 
	ciop-publish $OUTPUTDIR/$outputname.tgz

	# cleanup
	rm -rf $retrieved $OUTPUTDIR/$outputname.d* $OUTPUTDIR/$outputname.tgz 
done

exit $SUCCESS
