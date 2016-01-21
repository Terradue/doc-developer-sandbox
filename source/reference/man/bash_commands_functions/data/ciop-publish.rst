ciop-publish
============

Synopsis
--------

**ciop-publish** [-b base_path] [-r] [-h] [File...] | [-s]

Description
------------

``ciop-publish`` indicates to the framework the files or directory that are the output of the job. These files or directory published with this tool are passed as input for next job(s) (if any).


File Parameter:
This is the path of the file or directory to publish. If none is passed as arguments, they are read via *stdin*. Paths may be absolute or relative. In this latter case, the file base path is the task specific scratch place ('mapred_local_dir').
  
Options
-------

The following options are available:

``-b base_path``
directory name of the base path to complete relative path (default: ${mapred_local_dir})

``-r``
Turn on recursive finding for directory path. This option is important if the reference to pass must be all file in the dir and not just the dir (default: off)

``-m``
Publish the files as results of the entire workflow. Files are not going to be passed to the next job. They are placed in a persistent shared location common to the whole workflow. A metalink is generated at the end of the workflow or the job simulation.

``-d destination``
Destination of the files when option -m is set. By default the published destination is the local HDFS of the appliance. Other options are:
* s3 : to publish results in S3 private server.

``-a``
Publish the files on HDFS in an anonymous way (i.e. files are not going to be passed to the next job).

``-s``
Publish what comes from stdin as it is to the next job. This option desactivates all other options.
    
Exit status
-----------
* 0     publish executed successfully
* 1     an error occurred during publish processing
* 255   file or directory not found