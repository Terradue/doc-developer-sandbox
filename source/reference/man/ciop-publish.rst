ciop-publish
============

Name
----

**ciop-publish** -- indicates to the framework the files or directory that are the output of the job. These files or directory published with this tool are passed as input for next job(s) (if any).

Synopsis
--------

	| ciop-publish [-b base_path] [-r] [-h] [File...]


File Parameter:
    This is the path of the file or directory to publish. If none is passed as arguments, they are read via *stdin*. Paths may be absolute or relative. In this latter case, the file
    base path is the task specific scratch place ('mapred_local_dir')
  
Description
-----------

The following options are available:
    -h 				displays this help page
    -b base_path		directory name of the base path to complete relative path (default: ${mapred_local_dir})
    -r				Turn on recursive finding for directory path. This option is important if the reference to pass must be all files in the directory and not just the directory (default: off)

Output
------      
    
Exit status
-----------
    - **0** : publish executed successfully
    - **1** : an error occurred during publish processing
    - **255** : file or directory not found

Examples
--------