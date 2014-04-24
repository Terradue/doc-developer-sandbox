.. _stagedata:

Hands-On Exercise 3: staging data
#################################

In this Hands-On we will prepare input data for our workflow (Stage In) and we will publish out data as result of the workflow (Stage Out).   

Prepare the application.xml
===========================

The application.xml is the same used in the :doc:`Hands-On Exercise 1 <basic>`:

.. literalinclude:: src/basic/application.xml
  :language: xml
  :tab-width: 2

Download data from a catalogue
==============================

We need a local copy of the data in order to use them in our workflow. We can use the *ciop-copy* tool: 

.. code-block:: none

  $ cd $_CIOP_APPLICATION_PATH/inputs
  $ ciop-copy ./ http://catalogue.terradue.int/catalogue/search/MER_RR__1P/MER_RR__1PRLRA20120406_134456_000026243113_00240_52840_0230.N1/rdf
  $ ciop-copy ./ http://catalogue.terradue.int/catalogue/search/MER_RR__1P/MER_RR__1PRLRA20120407_112751_000026243113_00253_52853_0364.N1/rdf
  $ ls -l

The output of the *ls -l* command will be similar to:

.. code-block:: none
    
 total 1091164
 -rw-r--r-- 1 crossi ciop        12 Apr 22 10:24 list
 -rw-r--r-- 1 crossi ciop 558118134 Apr 24 17:41 MER_RR__1PRLRA20120406_134456_000026243113_00240_52840_0230.N1
 -rw-r--r-- 1 crossi ciop 558118134 Apr 24 17:35 MER_RR__1PRLRA20120407_112751_000026243113_00253_52853_0364.N1

Prepare the file list
=====================

* Open the file *inputs/list* and paste the following lines:

.. literalinclude:: src/stagedata/list
     :language: none

.. WARNING::
   The file *inputs/list* should contain only these two lines (without blank lines or comments).

Publish the data
================

* Open the file *my_node/run* and paste the following code:

.. literalinclude:: src/stagedata/run
   :language: bash
   :tab-width: 2

.. NOTE::
     The command *ciop-publish* will put the input data in the HDFS (the underlying Distributed File System). 

Run and debug the workflow
==========================

* Run the node *my_node*:

.. code-block:: none

  $ ciop-simjob my_node

The output will be similar to:

.. code-block:: none
   
 14/04/24 18:06:38 INFO my_node simulation started
 14/04/24 18:06:46 INFO Deleted hdfs://sb-10-16-10-21.dev.terradue.int:8020/tmp/sandbox/my_workflow/workflow-params.xml
 14/04/24 18:06:49 INFO Submitting job 12817 ...
 14/04/24 18:06:49 WARN streaming.StreamJob: -jobconf option is deprecated, please use -D instead.
 packageJobJar: [/var/lib/hadoop-0.20/cache/crossi/hadoop-unjar6012488669445715409/] [] /tmp/streamjob840740301405285441.jar tmpDir=null
 14/04/24 18:06:51 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
 14/04/24 18:06:51 WARN snappy.LoadSnappy: Snappy native library not loaded
 14/04/24 18:06:51 INFO mapred.FileInputFormat: Total input paths to process : 1
 14/04/24 18:06:52 INFO streaming.StreamJob: getLocalDirs(): [/var/lib/hadoop-0.20/cache/crossi/mapred/local]
 14/04/24 18:06:52 INFO streaming.StreamJob: Running job: job_201404181621_0005
 14/04/24 18:06:52 INFO streaming.StreamJob: To kill this job, run:
 14/04/24 18:06:52 INFO streaming.StreamJob: /usr/lib/hadoop-0.20/bin/hadoop job  -Dmapred.job.tracker=sb-10-16-10-21.dev.terradue.int:8021 -kill job_201404181621_0005
 14/04/24 18:06:52 INFO streaming.StreamJob: Tracking URL: http://sb-10-16-10-21.dev.terradue.int:50030/jobdetails.jsp?jobid=job_201404181621_0005
 14/04/24 18:06:53 INFO streaming.StreamJob:  map 0%  reduce 0%
 14/04/24 18:07:03 INFO streaming.StreamJob:  map 100%  reduce 0%
 14/04/24 18:09:02 INFO streaming.StreamJob:  map 100%  reduce 100%
 14/04/24 18:09:05 INFO streaming.StreamJob: Job complete: job_201404181621_0005
 14/04/24 18:09:05 INFO streaming.StreamJob: Output: /tmp/sandbox/my_workflow/my_node/output
 14/04/24 18:09:05 INFO my_node simulation ended (147 seconds)
 14/04/24 18:09:06 INFO my_node published:
 hdfs:///tmp/sandbox/my_workflow/my_node/data/MER_RR__1PRLRA20120406_134456_000026243113_00240_52840_0230.N1    
 hdfs:///tmp/sandbox/my_workflow/my_node/data/MER_RR__1PRLRA20120407_112751_000026243113_00253_52853_0364.N1     
 14/04/24 18:09:06 INFO The results are available at /share/tmp/sandbox/my_workflow/my_node/data

* Check the output of the application by copying the Tracking URL from the *ciop-simjob* command and paste it in a browser (see :doc:`Hands-On Exercise 2 <debug>`). You will see an output similar to:

.. figure:: includes/stagedata/gui1.png
   :scale: 70 %
   :alt: Attempts output

Recap
=====

#. We downloaded and prepared data from a remote catalogue,
#. We used it in our workflow (Stage In),
#. We published it in a distributed location (Stage Out).

Files used in this Hands-On
===========================

* :download:`application.xml <src/basic/application.xml>`
* :download:`inputs/list <src/stagedata/list>`
* :download:`my_node/run <src/stagedata/run>`
