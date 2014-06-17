#!/usr/bin/Rscript --vanilla --slave --quiet

# load rciop library to access the developer cloud sandbox functions
library("rciop")

# load any other R library required
library("rgeos")

# load the parametee values with rciop.getparam() function
myparam1 <- rciop.getparam("param1")
myparam2 <- rciop.getparam("param2")

# add a log message
rciop.log("DEBUG", paste("I'm running a job with parameter values:", myparam1, myparam2, sep=" "))

# read the inputs coming from stdin
f <- file("stdin")
open(f)

while(length(input <- readLines(f, n=1)) > 0) {
  
  rciop.log("INFO", paste("processing input:", input, sep=" "))
  
  # copy the input to the process temporary folder TMPDIR
  res <- rciop.copy(input, TMPDIR, uncompress=TRUE)
  
  if (res$exit.code==0) local.url <- res$output
  
  mycsv <- read.csv(local.url)
  
  # do something with the downloaded csv here in TMPDIR/output
  
  # publish the any results done 
  rciop.publish(paste(TMPDIR,"output", sep="/"), recursive=TRUE, metalink=FALSE)
 
}
