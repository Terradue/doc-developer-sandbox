.. _basic:

Hands-On Exercise 1: a basic workflow
#####################################

In this exercise we will prepare a simple workflow and we will execute a first run, using the CIOP tools.

Prerequisite
=============

* You have cloned the Hands-On git repository (see :ref:`hands-on-repo`)

Install the Hands-On
=====================

The Hands-On installation is quite forward and it is performed through the `Maven <http://maven.apache.org/>`_ tool:

.. code-block:: console

 cd
 cd dcs-hands-on
 mvn clean install -D hands.on=1 -P bash

With the last command you installed the first Hands-On exercise (option *-D*) using a *bash* profile (option *-P*). The profile represents the programming language used to implements the Hands-On run executables.  

Understand the workflow
=======================

A workflow is a DAG [#f1]_. There is a special file, named *application.xml*, that defines a workflow. The first step is to create an *application.xml*:
 
* Go to the application default path (/application), by typing:

.. code-block:: console
 
 cd $_CIOP_APPLICATION_PATH

* Check for a file named *application.xml*
 
* Open it with a text editor (e.g., vi) and inspect its content. It will be similar to:

.. container:: context-application-descriptor-file

  .. literalinclude:: src/dcs-hands-on/src/main/app-resources/hands-on-1/application.xml
    :language: xml
    :tab-width: 2

Check the inputs
=================
 
* Check for a file named *list* under the folder *inputs*:

.. code-block:: console

 cat inputs/list
 
* It will be similar to:

.. literalinclude:: src/dcs-hands-on/src/main/app-resources/hands-on-1/inputs/list
  :language: none

.. WARNING::
 This file should not contain blank lines at the end or at the beginning and comments are not allowed.
 
Check the run executable
========================

The run executable is responsible for *executing* your application in the Hadoop Sandbox. In the *application.xml* we defined a workflow with a single node and the related run executable:

.. container:: context-application-descriptor-file

  .. literalinclude:: src/dcs-hands-on/src/main/app-resources/hands-on-1/application.xml
      :language: xml
      :tab-width: 2
      :lines: 5-5
 
* Inspect the *run* executable:

.. code-block:: console

 cat my_node/run

.. admonition::

  Depending from the profile chosen, the run executable could have different equivalent forms.

Run the node 
============

* List the available node(s) with:

.. code-block:: console

 ciop-simjob -n
 
This returns:

.. code-block:: console-output

 my-node

* Execute it by typing:

.. code-block:: console

 ciop-simjob my_node

The output will be similar to:

.. code-block:: console-output

  15/02/20 15:38:56 INFO my_node simulation started
  15/02/20 15:39:03 INFO Submitting job 26207 ...
  15/02/20 15:39:03 WARN streaming.StreamJob: -jobconf option is deprecated, please use -D instead.
  15/02/20 15:39:03 INFO streaming.StreamJob: Dir hdfs://sb-10-16-10-62.dev.terradue.int:8020/user/crossi/monitor already exists
  packageJobJar: [/var/lib/hadoop-0.20/cache/crossi/hadoop-unjar4287208780576719330/] [] /tmp/streamjob4077770872494911200.jar tmpDir=null
  15/02/20 15:39:04 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
  15/02/20 15:39:04 WARN snappy.LoadSnappy: Snappy native library not loaded
  15/02/20 15:39:04 INFO mapred.FileInputFormat: Total input paths to process : 1
  15/02/20 15:39:04 INFO streaming.StreamJob: getLocalDirs(): [/var/lib/hadoop-0.20/cache/crossi/mapred/local]
  15/02/20 15:39:04 INFO streaming.StreamJob: Running job: job_201502201431_0002
  15/02/20 15:39:04 INFO streaming.StreamJob: To kill this job, run:
  15/02/20 15:39:04 INFO streaming.StreamJob: /usr/lib/hadoop-0.20/bin/hadoop job  -Dmapred.job.tracker=sb-10-16-10-62.dev.terradue.int:8021 -kill job_201502201431_0002
  15/02/20 15:39:04 INFO streaming.StreamJob: Tracking URL: http://sb-10-16-10-62.dev.terradue.int:50030/jobdetails.jsp?jobid=job_201502201431_0002
  15/02/20 15:39:05 INFO streaming.StreamJob:  map 0%  reduce 0%
  15/02/20 15:39:10 INFO streaming.StreamJob:  map 100%  reduce 0%
  15/02/20 15:39:18 INFO streaming.StreamJob:  map 100%  reduce 33%
  15/02/20 15:39:19 INFO streaming.StreamJob:  map 100%  reduce 100%
  15/02/20 15:39:20 INFO streaming.StreamJob: Job complete: job_201502201431_0002
  15/02/20 15:39:20 INFO streaming.StreamJob: Output: /tmp/sandbox/hands-on-1/my_node/output
  15/02/20 15:39:20 INFO my_node simulation ended (24 seconds)
  15/02/20 15:39:20 INFO my_node published:

  15/02/20 15:39:20 INFO The intermediate results are available at http://sb-10-16-10-62.dev.terradue.int:50075/browseDirectory.jsp?dir=/tmp/sandbox/hands-on-1/my_node%2Fdata&namenodeInfoPort=50070
  15/02/20 15:39:20 INFO The published results are available at http://sb-10-16-10-62.dev.terradue.int:50075/browseDirectory.jsp?dir=/tmp/sandbox/hands-on-1/my_node%2F_results&namenodeInfoPort=50070

.. admonition:: Note 1

 The log entry with:

 .. code-block:: none

  15/02/20 15:39:04 INFO mapred.FileInputFormat: Total input paths to process : 1

 means the framework got one input file containing the two inputs input1 and input2.

.. admonition:: Note 2

  Since the Sandbox used here has two cores, and the node 'my_node' has to process only two inputs, the input1 and input2 lines have been processed in parallel by two tasks (each task processing a single entry of the input file).

Recap
=====

#. We installed a simple workflow with a single node,
#. We passed to the workflow a list of two data inputs,
#. We executed a simple run that logs the name of data inputs, using two tasks in parallel.

.. rubric:: Footnotes

.. [#f1] `Directed acyclic graph <http://en.wikipedia.org/wiki/Directed_acyclic_graph>`_
