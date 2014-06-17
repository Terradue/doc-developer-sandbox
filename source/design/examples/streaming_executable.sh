#!/bin/sh

# source the ciop functions (e.g. ciop-log)
source ${ciop_job_include}

# define the exit codes
SUCCESS=0
ERR_NOCSV=20

# add a trap to exit gracefully
function cleanExit ()
{
   local retval=$?
   local msg=""
   case "${retval}" in
    ${SUCCESS}) msg="Processing successfully concluded";;
    ${ERR_NOCSVS}) msg="Could not retrieve the CSV file";;
    *) msg="Unknown error";;
   esac
   [ "${retval}" != "0" ] && ciop-log "ERROR" "Error ${retval} - ${msg}, processing aborted" || ciop-log "INFO" "${msg}"
   exit ${retval}
}
trap cleanExit EXIT

myparam1="`ciop-getparam param1`"
myparam2="`ciop-getparam param2`"

ciop-log "DEBUG" "Processing the job with $myparam1 and $myparam2"

# read the stdin
while read input
do
  
  ciop-log "INFO" "Processing input: $input"
  
  # pass the input to ciop-copy
  localurl=`echo $input | ciop-copy -O $TMPDIR`
  
  # check the exit code
  res=$?
  [ $res != 0 ] && exit $ERR_NOCSV
  
  # do something with the downloaded product
  
  
  # publish the result
  ciop-publish -r $TMPDIR/output

done  
