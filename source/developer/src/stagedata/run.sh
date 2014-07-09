#!/bin/bash

# source the ciop functions (e.g. ciop-log, ciop-getparam)
source ${ciop_job_include}

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

# Loops over all inputs
while read inputfile 
do
	# report activity in log
	ciop-log "INFO" "Retrieving $inputfile from storage"

	# retrieve the MER_RR__1P product to the local temporary folder TMPDIR provided by the framework (this folder is only used by this process)
	# the ciop-copy utility will use one of online resource available in the metadata to copy it to the TMPDIR folder
	# the utility returns the local path so the variable $retrieved contains the local path to the MERIS product
	retrieved=`ciop-copy -o $TMPDIR "$inputfile"`

	# check if the file was retrieved, if not exit with the error code $ERR_NOINPUT
	[ "$?" == "0" -a -e "$retrieved" ] || exit $ERR_NOINPUT

	# report activity in the log
	ciop-log "INFO" "Retrieved `basename $retrieved`"

	# publish the result 
	# ciop-publish copies the data retrieved  to the distributed filesystem (HDFS)
	ciop-log "INFO" "Publishing result"	
	ciop-publish $TMPDIR/*.N1
done

exit $SUCCESS
