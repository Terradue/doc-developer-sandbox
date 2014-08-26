.. _basic:

Hands-On Exercise 1: a basic workflow
#####################################

In this exercise we will prepare a simple workflow and we will execute a first run, using the CIOP tools.

Prepare the workflow
====================

A workflow is a DAG [#f1]_. There is a special file, named *application.xml*, that defines a workflow. The first step is to create an *application.xml*:
 
* Go to the application default path (/application), by typing:

.. code-block:: console
 
 cd $_CIOP_APPLICATION_PATH

* Create a file named *application.xml*:

.. code-block:: console

 touch application.xml
 
* Give to your user/group the read/write permissions:

.. code-block:: console

 chmod 664 application.xml
 
* Open it with a text editor (e.g. vi) and paste the following code:

.. container:: context-application-descriptor-file

  .. literalinclude:: src/basic/application.xml
    :language: xml
    :tab-width: 2

Prepare the test inputs
=======================
 
* Create a file named list:

.. code-block:: console

 mkdir inputs
 touch inputs/list
 
* Open it with a text editor and paste the following lines:

.. literalinclude:: src/basic/list
  :language: none

.. WARNING::
 The file should contain only the two lines, without blank lines at the end or at the beginning. Furthermore, comments are not allowed.
 
 
Prepare the run executable
================================

The run executable is responsible for *executing* your application in the Sandbox. In the *application.xml* we defined a workflow with a single node and the related run executable:

.. container:: context-application-descriptor-file

  .. literalinclude:: src/basic/application.xml
      :language: xml
      :tab-width: 2
      :lines: 5-5

* Go to the application default path and create the executable directory:

.. code-block:: console

 cd $_CIOP_APPLICATION_PATH
 mkdir my_node
 cd my_node
 
* Create a file named *run* and make it executable:

.. code-block:: console

 touch run.sh
 chmod +x run.sh
 
* Open it with a text editor and paste the following code:

.. container:: context-run-executable

  .. literalinclude:: src/basic/run.sh
    :language: bash
    :tab-width: 2

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

 14/07/09 12:27:53 INFO my_node simulation started
 14/07/09 12:27:59 INFO Submitting job 29320 ...
 14/07/09 12:28:00 WARN streaming.StreamJob: -jobconf option is deprecated, please use -D instead.
 14/07/09 12:28:00 INFO streaming.StreamJob: Dir hdfs://sb-10-16-10-33.dev.terradue.int:8020/user/crossi/monitor already exists
 packageJobJar: [/var/lib/hadoop-0.20/cache/crossi/hadoop-unjar5166177858423309635/] [] /tmp/streamjob8508172352164240164.jar tmpDir=null
 14/07/09 12:28:00 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
 14/07/09 12:28:00 WARN snappy.LoadSnappy: Snappy native library not loaded
 14/07/09 12:28:00 INFO mapred.FileInputFormat: Total input paths to process : 1
 14/07/09 12:28:00 INFO streaming.StreamJob: getLocalDirs(): [/var/lib/hadoop-0.20/cache/crossi/mapred/local]
 14/07/09 12:28:00 INFO streaming.StreamJob: Running job: job_201407031504_0051
 14/07/09 12:28:00 INFO streaming.StreamJob: To kill this job, run:
 14/07/09 12:28:00 INFO streaming.StreamJob: /usr/lib/hadoop-0.20/bin/hadoop job  -Dmapred.job.tracker=sb-10-16-10-33.dev.terradue.int:8021 -kill job_201407031504_0051
 14/07/09 12:28:00 INFO streaming.StreamJob: Tracking URL: http://sb-10-16-10-33.dev.terradue.int:50030/jobdetails.jsp?jobid=job_201407031504_0051
 14/07/09 12:28:01 INFO streaming.StreamJob:  map 0%  reduce 0%
 14/07/09 12:28:06 INFO streaming.StreamJob:  map 100%  reduce 0%
 14/07/09 12:28:13 INFO streaming.StreamJob:  map 100%  reduce 33%
 14/07/09 12:28:15 INFO streaming.StreamJob:  map 100%  reduce 100%
 14/07/09 12:28:16 INFO streaming.StreamJob: Job complete: job_201407031504_0051
 14/07/09 12:28:16 INFO streaming.StreamJob: Output: /tmp/sandbox/my_workflow/my_node/output
 14/07/09 12:28:16 INFO my_node simulation ended (23 seconds)
 14/07/09 12:28:17 INFO my_node published:
 
 14/07/09 12:28:17 INFO The intermediate results are available at http://sb-10-16-10-33.dev.terradue.int:50075/browseDirectory.jsp?dir=/tmp/sandbox/my_workflow/my_node%2Fdata&namenodeInfoPort=50070
 14/07/09 12:28:17 INFO The published results are available at http://sb-10-16-10-33.dev.terradue.int:50075/browseDirectory.jsp?dir=/tmp/sandbox/my_workflow/my_node%2F_results&namenodeInfoPort=50070

.. admonition:: Note 1

 The log entry with:

 .. code-block:: none

  14/07/09 12:28:00 INFO mapred.FileInputFormat: Total input paths to process : 1

 means the framework got one input file containing the two inputs input1 and input2.

.. admonition:: Note 2

  Since the Sandbox used here has two cores, and the node 'my_node' has to process only two inputs, the input1 and input2 lines have been processed in parallel by two tasks (each task processing a single entry of the input file).

Recap
=====

#. We created a simple workflow with a single node,
#. We prepared a list of two data inputs,
#. We prepared a simple run executable that logs (through the *ciop-log* function) the name of data inputs,
#. We executed the node with two data inputs, using two tasks in parallel.

Files used in this Hands-On
===========================

* :download:`application.xml <src/basic/application.xml>`
* :download:`inputs/list <src/basic/list>`  
* :download:`my_node/run.sh <src/basic/run.sh>`

.. rubric:: Footnotes

.. [#f1] `Directed acyclic graph <http://en.wikipedia.org/wiki/Directed_acyclic_graph>`_
