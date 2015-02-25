.. _multinode:

Hands-On Exercise 6: a multi-node workflow
##########################################

In this exercise we will run a workflow with two nodes, passing inputs from first to the second and finally publishing the workflow results on HDFS.   

Prerequisite
=============

* You have cloned the Hands-On git repository (see :ref:`hands-on-repo`)

Install the Hands-On
====================

* Install the Hands-On Exercise 6, just typing:

.. code-block:: console

  cd
  cd dcs-hands-on
  mvn install -D hands.on=6 -P bash

Install the required packages
=============================

The second node that we added (*node_binning*) needs convert tools to perform image manipulations. This tool is named ImageMagick [#f1]_.

* Type the following command:

.. code-block:: console

  sudo yum install -y ImageMagick


Inspect the application.xml
===========================

* Inspect the *application.xml*:

.. container:: context-application-descriptor-file

  .. literalinclude:: src/dcs-hands-on/src/main/app-resources/hands-on-6/application.xml
       :language: xml
       :tab-width: 2

We added a second node named *node_binning* and we declared that its source is the node_expression. Actually we concatenated the two nodes:  

.. container:: context-application-descriptor-file

  .. literalinclude:: src/dcs-hands-on/src/main/app-resources/hands-on-6/application.xml
       :language: xml
       :tab-width: 2
       :lines: 60-68

Inspect the run executable
===========================

* Now we are going to see how the run executable for node binning looks like. You can use the *more* command:   

.. code-block:: console

  cd $_CIOP_APPLICATION_PATH/binning
  more run

Note that the *ciop-publish* command is called with the option *-m*. This means that it will publish the files as results of the entire workflow. Files are not going to be passed to the next job. They are placed in a persistent shared location common to the whole workflow.

.. container:: context-run-executable

  .. literalinclude:: src/dcs-hands-on/src/main/app-resources/hands-on-6/bash/binning/run
       :language: bash
       :tab-width: 2
       :lines: 138

Run and debug the workflow
==========================

* Check the available nodes with:

.. code-block:: console

  ciop-simjob -n

You will see:

.. code-block:: console-output

  node_expression
  node_binning

* Run the node *node_binning*:

.. code-block:: console

  ciop-simjob node_binning

The output will be similar to:

.. code-block:: console-output

  14/07/04 18:03:05 INFO node_binning simulation started
  14/07/04 18:03:10 INFO Submitting job 14241 ...
  14/07/04 18:03:11 WARN streaming.StreamJob: -jobconf option is deprecated, please use -D instead.
  14/07/04 18:03:11 INFO streaming.StreamJob: Dir hdfs://sb-10-16-10-33.dev.terradue.int:8020/user/crossi/monitor already exists
  packageJobJar: [/var/lib/hadoop-0.20/cache/crossi/hadoop-unjar1310853949407034285/] [] /tmp/streamjob5828494070521580741.jar tmpDir=null
  14/07/04 18:03:12 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
  14/07/04 18:03:12 WARN snappy.LoadSnappy: Snappy native library not loaded
  14/07/04 18:03:12 INFO mapred.FileInputFormat: Total input paths to process : 1
  14/07/04 18:03:12 INFO streaming.StreamJob: getLocalDirs(): [/var/lib/hadoop-0.20/cache/crossi/mapred/local]
  14/07/04 18:03:12 INFO streaming.StreamJob: Running job: job_201407031504_0017
  14/07/04 18:03:12 INFO streaming.StreamJob: To kill this job, run:
  14/07/04 18:03:12 INFO streaming.StreamJob: /usr/lib/hadoop-0.20/bin/hadoop job  -Dmapred.job.tracker=sb-10-16-10-33.dev.terradue.int:8021 -kill job_201407031504_0017
  14/07/04 18:03:12 INFO streaming.StreamJob: Tracking URL: http://sb-10-16-10-33.dev.terradue.int:50030/jobdetails.jsp?jobid=job_201407031504_0017
  14/07/04 18:03:13 INFO streaming.StreamJob:  map 0%  reduce 0%
  14/07/04 18:03:15 INFO streaming.StreamJob:  map 100%  reduce 0%
  14/07/04 18:03:22 INFO streaming.StreamJob:  map 100%  reduce 33%
  14/07/04 18:03:25 INFO streaming.StreamJob:  map 100%  reduce 100%
  14/07/04 18:04:20 INFO streaming.StreamJob: Job complete: job_201407031504_0017
  14/07/04 18:04:20 INFO streaming.StreamJob: Output: /tmp/sandbox/beam_arithm/node_binning/output
  14/07/04 18:04:21 INFO node_binning simulation ended (76 seconds)
  14/07/04 18:04:21 INFO node_binning published:
 
  14/07/04 18:04:21 INFO The intermediate results are available at http://sb-10-16-10-33.dev.terradue.int:50075/browseDirectory.jsp?dir=/tmp/sandbox/beam_arithm/node_binning%2Fdata&namenodeInfoPort=50070
  14/07/04 18:04:21 INFO The published results are available at http://sb-10-16-10-33.dev.terradue.int:50075/browseDirectory.jsp?dir=/tmp/sandbox/beam_arithm/node_binning%2F_results&namenodeInfoPort=50070

* Run the entire workflow:

.. code-block:: console

  ciop-simwf

* Follow the execution until it ends (approximately five minutes),

* Check the output of the command *ciop-simwf*. It will be similar to:

.. code-block:: console-output

  Job ID : 0000000-140703150626955-oozie-oozi-W
  ------------------------------------------------------------------------------------------------------
  Workflow Name : beam_arithm
  App Path      : hdfs://sb-10-16-10-33.dev.terradue.int:8020/tmp/sandbox/beam_arithm/workflow.xml
  Status        : SUCCEEDED
  Run           : 0
  User          : crossi
  Group         : users
  Created       : 2014-07-04 18:16
  Started       : 2014-07-04 18:16
  Last Modified : 2014-07-04 18:20
  Ended         : 2014-07-04 18:20

  Actions
  -------------------------------------------------------------------------------------------------------
  ID                                                      Status    Ext ID                 Ext Status Err Code
  -------------------------------------------------------------------------------------------------------
  0000000-140703150626955-oozie-oozi-W@prepare            OK        job_201407031504_0019  SUCCEEDED  -
  -------------------------------------------------------------------------------------------------------
  0000000-140703150626955-oozie-oozi-W@n-node_expression  OK        job_201407031504_0021  SUCCEEDED  -
  -------------------------------------------------------------------------------------------------------
  0000000-140703150626955-oozie-oozi-W@n-node_binning     OK        job_201407031504_0023  SUCCEEDED  -
  -------------------------------------------------------------------------------------------------------
  0000000-140703150626955-oozie-oozi-W@publish-results    OK        job_201407031504_0025  SUCCEEDED  -
  -------------------------------------------------------------------------------------------------------
  0000000-140703150626955-oozie-oozi-W@clean              OK        -                      OK         -
  -------------------------------------------------------------------------------------------------------

* To close the *ciop-simwf* output page, press CTRL+C.

Recap
=====

#. We added a second node (*node_binning*) to our workflow,
#. We published results as final results of the workflow,
#. We ran the added node using the *ciop-simjob* command,
#. We ran the entire workflow using the *ciop-simwf* command.

.. rubric:: Footnotes

.. [#f1] `ImageMagick <http://www.imagemagick.org/>`_
