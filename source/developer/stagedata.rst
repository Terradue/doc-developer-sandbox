.. _stagedata:

Hands-On Exercise 3: staging data
#################################

In this exercise we will prepare input data for our workflow (this process is named *Stage In*) and we will publish out data as result of the workflow (this process is named *Stage Out*).   

Prerequisite
=============

* You have cloned the Hands-On git repository (see :ref:`hands-on-repo`)

Install the Hands-On
=====================

* Install the Hands-On Exercise 3, just typing:

.. code-block:: console

  cd
  cd dcs-hands-on
  mvn clean install -D hands.on=3 -P bash

Inspect the application.xml
===========================

The application.xml is similar to the one used in the exercise :doc:`a basic workflow <basic>`:

.. container:: context-application-descriptor-file

  .. literalinclude:: src/dcs-hands-on/src/main/app-resources/hands-on-3/application.xml
    :language: xml
    :tab-width: 2

Download data from a catalogue
==============================

We need a local copy of the data in order to use them in our workflow. We can use the *ciop-copy* tool.

* Type the following commands: 

.. code-block:: console

  cd /tmp
  ciop-copy -o ./ http://catalogue.terradue.int/catalogue/search/MER_RR__1P/MER_RR__1PRLRA20120407_112751_000026243113_00253_52853_0364.N1/rdf
  ciop-copy -o ./ http://catalogue.terradue.int/catalogue/search/MER_RR__1P/MER_RR__1PRLRA20120406_102429_000026213113_00238_52838_0211.N1/rdf
  ls -l | grep MER_RR

The output of the *ls -l* command will be similar to:

.. code-block:: console-output
    
 total 1091164
 -rw-r--r-- 1 crossi ciop 558118134 Apr 24 17:41 MER_RR__1PRLRA20120406_102429_000026213113_00238_52838_0211.N1
 -rw-r--r-- 1 crossi ciop 558118134 Apr 24 17:35 MER_RR__1PRLRA20120407_112751_000026243113_00253_52853_0364.N1

Inspect the file list
=====================

* Open the file */application/inputs/list* and see the following lines:

.. literalinclude:: src/dcs-hands-on/src/main/app-resources/hands-on-3/inputs/list
     :language: none

.. WARNING::
   The file *inputs/list* should contain only these two lines (without blank lines or comments).

Publish the data
================

* Inspect the file *my_node/run* using for example the *more* command:

.. code-block:: console
  
  cd $_CIOP_APPLICATION_PATH
  more my_node/run

* Note the *ciop-publish* command

.. container:: context-run-executable

  .. literalinclude:: src/dcs-hands-on/src/main/app-resources/hands-on-3/my_node/run
     :language: bash
     :tab-width: 2
     :lines: 5-5

.. NOTE::
     The command *ciop-publish* will put the input data in the HDFS (the underlying Distributed File System) and it will pass its references to the subsequent node. Its actual implementation could be different, depending from the language used to implement the run executables. In the above example we used *bash*. 

Run and debug the workflow
==========================

* Run the node *my_node*:

.. code-block:: console

  ciop-simjob my_node

The output will be similar to:

.. code-block:: console-output

  15/02/26 17:48:41 INFO my_node simulation started
  15/02/26 17:48:49 INFO Submitting job 3836 ...
  15/02/26 17:48:49 WARN streaming.StreamJob: -jobconf option is deprecated, please use -D instead.
  15/02/26 17:48:50 INFO streaming.StreamJob: Dir hdfs://sb-10-16-10-62.dev.terradue.int:8020/user/crossi/monitor already exists
  packageJobJar: [/var/lib/hadoop-0.20/cache/crossi/hadoop-unjar5728555267094324953/] [] /tmp/streamjob8017142955103520886.jar tmpDir=null
  15/02/26 17:48:50 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
  15/02/26 17:48:50 WARN snappy.LoadSnappy: Snappy native library not loaded
  15/02/26 17:48:50 INFO mapred.FileInputFormat: Total input paths to process : 1
  15/02/26 17:48:51 INFO streaming.StreamJob: getLocalDirs(): [/var/lib/hadoop-0.20/cache/crossi/mapred/local]
  15/02/26 17:48:51 INFO streaming.StreamJob: Running job: job_201502261731_0001
  15/02/26 17:48:51 INFO streaming.StreamJob: To kill this job, run:
  15/02/26 17:48:51 INFO streaming.StreamJob: /usr/lib/hadoop-0.20/bin/hadoop job  -Dmapred.job.tracker=sb-10-16-10-62.dev.terradue.int:8021 -kill job_201502261731_0001
  15/02/26 17:48:51 INFO streaming.StreamJob: Tracking URL: http://sb-10-16-10-62.dev.terradue.int:50030/jobdetails.jsp?jobid=job_201502261731_0001
  15/02/26 17:48:52 INFO streaming.StreamJob:  map 0%  reduce 0%
  15/02/26 17:49:01 INFO streaming.StreamJob:  map 100%  reduce 0%
  15/02/26 17:49:34 INFO streaming.StreamJob:  map 100%  reduce 33%
  15/02/26 17:49:36 INFO streaming.StreamJob:  map 100%  reduce 100%
  15/02/26 17:49:37 INFO streaming.StreamJob: Job complete: job_201502261731_0001
  15/02/26 17:49:37 INFO streaming.StreamJob: Output: /tmp/sandbox/hands-on-3/my_node/output
  15/02/26 17:49:38 INFO my_node simulation ended (57 seconds)
  15/02/26 17:49:38 INFO my_node published:
   hdfs://sb-10-16-10-62.dev.terradue.int:8020/tmp/sandbox/hands-on-3/my_node/data/MER_RR__1PRLRA20120406_102429_000026213113_00238_52838_0211.N1
   hdfs://sb-10-16-10-62.dev.terradue.int:8020/tmp/sandbox/hands-on-3/my_node/data/MER_RR__1PRLRA20120407_112751_000026243113_00253_52853_0364.N1
   15/02/26 17:49:38 INFO The intermediate results are available at http://sb-10-16-10-62.dev.terradue.int:50075/browseDirectory.jsp?dir=/tmp/sandbox/hands-on-3/my_node%2Fdata&namenodeInfoPort=50070
   15/02/26 17:49:38 INFO The published results are available at http://sb-10-16-10-62.dev.terradue.int:50075/browseDirectory.jsp?dir=/tmp/sandbox/hands-on-3/my_node%2F_results&namenodeInfoPort=50070

* Check the output of the application by copying the Tracking URL from the *ciop-simjob* command and paste it in a browser (see :doc:`make a robust workflow and debug it <debug>`). You will see an output similar to:

.. figure:: includes/stagedata/gui1.png
   :scale: 70 %
   :alt: Attempts output

Recap
=====

#. We downloaded and prepared data from a remote catalogue,
#. We used it in our workflow (*Stage In*),
