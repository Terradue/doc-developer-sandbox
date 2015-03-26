.. _multinode:

Hands-On Exercise 6: a multi-node workflow
##########################################

In this exercise we will run an application workflow dedined by two nodes, passing outputs from the first as inputs to the second, and finally publishing the workflow results on HDFS.   

Prerequisite
=============

* You have cloned the Hands-On git repository (see :ref:`hands-on-repo`).

Install the Hands-On
====================

* Install the Hands-On Exercise 6, just type:

.. code-block:: console

  cd
  cd dcs-hands-on
  mvn clean install -D hands.on=6 -P bash

Inspect the application.xml
===========================

* Inspect the *application.xml*:

.. container:: context-application-descriptor-file

  .. literalinclude:: src/dcs-hands-on/src/main/app-resources/hands-on-6/application.xml
       :language: xml
       :tab-width: 2

We added a second processing node, named *node_binning*, and we declared that its source is the *node_expression*.

.. container:: context-application-descriptor-file

  .. literalinclude:: src/dcs-hands-on/src/main/app-resources/hands-on-6/application.xml
       :language: xml
       :tab-width: 2
       :lines: 60-68

Inspect the run executable
===========================

* Now we are going to see how the run executable for *node binning* looks like. You can use the *more* command:   

.. code-block:: console

  cd $_CIOP_APPLICATION_PATH/binning
  more run
  grep ciop-publish run

Note that the *ciop-publish* command is called with the option *-m*. This means that it will publish the files as results of the entire workflow. Files are not going to be passed to any subsequent job. They are placed in a persistent shared location common to the whole workflow.

Run and debug the workflow
==========================

* Check the available nodes with:

.. code-block:: console

  ciop-simjob -n

You will see:

.. code-block:: console-output

  node_expression
  node_binning

* Run the node *node_expression*:

.. code-block:: console

  ciop-simjob node_expression

* Run the node *node_binning*:

.. code-block:: console

  ciop-simjob node_binning

The output will be similar to:

.. code-block:: console-output

  15/03/03 11:29:35 INFO node_binning simulation started
  15/03/03 11:29:40 INFO Submitting job 28128 ...
  15/03/03 11:29:40 WARN streaming.StreamJob: -jobconf option is deprecated, please use -D instead.
  15/03/03 11:29:41 INFO streaming.StreamJob: Dir hdfs://sb-10-16-10-30.dev.terradue.int:8020/user/cdangelis/monitor already exists
  packageJobJar: [/var/lib/hadoop-0.20/cache/cdangelis/hadoop-unjar1829937380881405939/] [] /tmp/streamjob7701460819939999938.jar tmpDir=null
  15/03/03 11:29:41 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
  15/03/03 11:29:41 WARN snappy.LoadSnappy: Snappy native library not loaded
  15/03/03 11:29:41 INFO mapred.FileInputFormat: Total input paths to process : 1
  15/03/03 11:29:41 INFO streaming.StreamJob: getLocalDirs(): [/var/lib/hadoop-0.20/cache/cdangelis/mapred/local]
  15/03/03 11:29:41 INFO streaming.StreamJob: Running job: job_201502191028_0493
  15/03/03 11:29:41 INFO streaming.StreamJob: To kill this job, run:
  15/03/03 11:29:41 INFO streaming.StreamJob: /usr/lib/hadoop-0.20/bin/hadoop job  -Dmapred.job.tracker=sb-10-16-10-30.dev.terradue.int:8021 -kill job_201502191028_0493
  15/03/03 11:29:41 INFO streaming.StreamJob: Tracking URL: http://sb-10-16-10-30.dev.terradue.int:50030/jobdetails.jsp?jobid=job_201502191028_0493
  15/03/03 11:29:42 INFO streaming.StreamJob:  map 0%  reduce 0%
  15/03/03 11:29:44 INFO streaming.StreamJob:  map 100%  reduce 0%
  15/03/03 11:29:51 INFO streaming.StreamJob:  map 100%  reduce 33%
  15/03/03 11:29:54 INFO streaming.StreamJob:  map 100%  reduce 100%
  15/03/03 11:30:58 INFO streaming.StreamJob: Job complete: job_201502191028_0493
  15/03/03 11:30:58 INFO streaming.StreamJob: Output: /tmp/sandbox/hands-on-6/node_binning/output
  15/03/03 11:30:58 INFO node_binning simulation ended (83 seconds)
  15/03/03 11:30:58 INFO node_binning published:
   
  15/03/03 11:30:58 INFO The intermediate results are available at http://sb-10-16-10-30.dev.terradue.int:50075/browseDirectory.jsp?dir=/tmp/sandbox/hands-on-6/node_binning%2Fdata&namenodeInfoPort=50070
  15/03/03 11:30:58 INFO The published results are available at http://sb-10-16-10-30.dev.terradue.int:50075/browseDirectory.jsp?dir=/tmp/sandbox/hands-on-6/node_binning%2F_results&namenodeInfoPort=50070

Note in these logs how the job definition is ran as a Hadoop MapReduce Streaming task.
A MapReduce job usually splits the input source so that independent data chunks are processed by the map tasks in a completely parallel manner.
The Hadoop framework takes care of tasks scheduling & monitoring, and re-executes the failed tasks.

* Run the entire workflow:

.. code-block:: console

  ciop-simwf

* Follow the execution until it ends (approximately five minutes),

* Check the output of the command *ciop-simwf*. It will be similar to:

.. code-block:: console-output

  Job ID : 0000267-150209145053100-oozie-oozi-W
  ------------------------------------------------------------------------------------------------------------------------------------
  Workflow Name : hands-on-6
  App Path      : hdfs://sb-10-16-10-30.dev.terradue.int:8020/tmp/1727a922-5461-48e2-81f3-2f6985654b52hands-on-6/workflow.xml
  Status        : SUCCEEDED
  Run           : 0
  User          : cdangelis
  Group         : users
  Created       : 2015-03-03 11:32
  Started       : 2015-03-03 11:32
  Last Modified : 2015-03-03 11:34
  Ended         : 2015-03-03 11:34

  Actions
  ------------------------------------------------------------------------------------------------------------------------------------
  ID                                                                            Status    Ext ID                 Ext Status Err Code
  ------------------------------------------------------------------------------------------------------------------------------------
  0000267-150209145053100-oozie-oozi-W@hdfscommands                             OK    -                      OK         -
  ------------------------------------------------------------------------------------------------------------------------------------
  0000267-150209145053100-oozie-oozi-W@n-node_expression                        OK        job_201502191028_0495  SUCCEEDED  -
  ------------------------------------------------------------------------------------------------------------------------------------
  0000267-150209145053100-oozie-oozi-W@n-node_binning                           OK        job_201502191028_0497  SUCCEEDED  -
  ------------------------------------------------------------------------------------------------------------------------------------
  0000267-150209145053100-oozie-oozi-W@publish-results                          OK        job_201502191028_0499  SUCCEEDED  -
  ------------------------------------------------------------------------------------------------------------------------------------

* To close the *ciop-simwf* output page, press CTRL+C.

Recap
=====

#. We added a second node (*node_binning*) to our workflow;
#. We published results as final results of the workflow;
#. We ran the added node using the *ciop-simjob* command;
#. We saw how a job is handled by the framework as parallel tasks, during the workflow execution;
#. We ran the entire workflow using the *ciop-simwf* command.

.. rubric:: Footnotes

.. [#f1] `ImageMagick <http://www.imagemagick.org/>`_
