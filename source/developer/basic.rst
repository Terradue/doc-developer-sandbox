.. _basic:

Hands-On Exercise 1: a basic workflow
#####################################

In this exercise we will prepare a simple workflow and we will execute a first demo run, using the CIOP tools.

Prepare the workflow
====================

A workflow is a DAG [#f1]_. There is a special file, named *application.xml*, that defines a workflow. The first step is to create an *application.xml*:
 
* First of all, go to the application default path (/application):

.. code-block:: bash

  $ cd $_CIOP_APPLICATION_PATH

* Create a file named *application.xml*:

.. code-block:: bash

 $ touch application.xml
 
* Give to your user/group the read/write permissions:

.. code-block:: bash

 $ chmod 664 application.xml
 
* Open it with a text editor (e.g. vi) and paste the following code:

.. literalinclude:: src/basic/application.xml
  :language: xml
  :tab-width: 2

Prepare the test inputs
=======================
 
* Create a file named list:

.. code-block:: bash

 $ mkdir inputs
 $ touch inputs/list
 
* Open it with a text editor and paste the following lines:

.. code-block:: none

 file1
 file2

.. WARNING::
 The file should contain only the two lines, without blank lines at the end or at the beginning. Furthermore, comments are not allowed.
 
 
Prepare the streaming executable
================================

The streaming executable is responsbile for *executing* your application in the Sandbox. In the *application.xml* we defined a workflow with a single node and the related streaming executable:

.. literalinclude:: src/basic/application.xml
  :language: xml
  :tab-width: 2
  :lines: 5-5

* Go to the application default path and create the executable directory:

.. code-block:: none

 $ cd /application
 $ mkdir my_node
 $ cd my_node
 
* Create a file named *run* and make it executable:

.. code-block:: none

 $ touch run
 $ chmod +x run
 
* Open it with a text editor and paste the following code:

.. literalinclude:: src/basic/run
  :language: bash
  :tab-width: 2

Run the node 
============

We created a workflow with a single node. List the node(s) with:

.. code-block:: bash

 $ ciop-simjob -n
 
This returns

.. code-block:: bash

 my-node

We can execute it by typing:

.. code-block:: bash

 $ ciop-simjob my_node

The output will be similar to:

.. code-block:: none

 14/04/22 17:50:30 INFO my_node simulation started
 14/04/22 17:50:39 INFO Submitting job 23111 ...
 14/04/22 17:50:39 WARN streaming.StreamJob: -jobconf option is deprecated, please use -D instead.
 packageJobJar: [/var/lib/hadoop-0.20/cache/crossi/hadoop-unjar7460568497055080537/] [] /tmp/streamjob6260064869370768639.jar tmpDir=null
 14/04/22 17:50:41 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
 14/04/22 17:50:41 WARN snappy.LoadSnappy: Snappy native library not loaded
 14/04/22 17:50:41 INFO mapred.FileInputFormat: Total input paths to process : 1
 14/04/22 17:50:41 INFO streaming.StreamJob: getLocalDirs(): [/var/lib/hadoop-0.20/cache/crossi/mapred/local]
 14/04/22 17:50:41 INFO streaming.StreamJob: Running job: job_201404181621_0003
 14/04/22 17:50:41 INFO streaming.StreamJob: To kill this job, run:
 14/04/22 17:50:41 INFO streaming.StreamJob: /usr/lib/hadoop-0.20/bin/hadoop job  -Dmapred.job.tracker=sb-10-16-10-21.dev.terradue.int:8021 -kill job_201404181621_0003
 14/04/22 17:50:41 INFO streaming.StreamJob: Tracking URL: http://sb-10-16-10-21.dev.terradue.int:50030/jobdetails.jsp?jobid=job_201404181621_0003
 14/04/22 17:50:42 INFO streaming.StreamJob:  map 0%  reduce 0%
 14/04/22 17:50:46 INFO streaming.StreamJob:  map 100%  reduce 0%
 14/04/22 17:50:53 INFO streaming.StreamJob:  map 100%  reduce 33%
 14/04/22 17:50:54 INFO streaming.StreamJob:  map 100%  reduce 100%
 14/04/22 17:50:56 INFO streaming.StreamJob: Job complete: job_201404181621_0003
 14/04/22 17:50:56 INFO streaming.StreamJob: Output: /tmp/sandbox/my_workflow/my_node/output
 14/04/22 17:50:57 INFO my_node simulation ended (27 seconds)
 14/04/22 17:50:57 INFO my_node published:
 
 14/04/22 17:50:57 INFO The results are available at /share/tmp/sandbox/my_workflow/my_node/data

.. NOTE::
      Since the Sandbox has two cores and the node my_node two inputs, they have been executed two tasks in parallel, each one processing a single input.

Recap
=====

#. We created a simple workflow with a single node,
#. We prepared a list of two test inputs,
#. We prepared a simple streaming executable that logs (through the *ciop-log* function) the name of the inputs,
#. We executed the node with two inputs, using two tasks in parallel.

Files used in this Hands-On
===========================

* :download:`application.xml <src/basic/application.xml>`
* :download:`inputs/list <src/basic/list>`  
* :download:`my_node/run <src/basic/run>`

.. rubric:: Footnotes

.. [#f1] `Directed acyclic graph <http://en.wikipedia.org/wiki/Directed_acyclic_graph>`_
