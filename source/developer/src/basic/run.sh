#!/bin/bash

# source the ciop functions (e.g. ciop-log, ciop-getparam)
source ${ciop_job_include}

# Loops over all the inputs
while read inputfile 
do
	# report activity in log
	ciop-log "INFO" "The input file is: $inputfile"
done

exit 0
