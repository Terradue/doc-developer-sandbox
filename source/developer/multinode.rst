.. _multinode:

Hands-On Exercise 6: a multi-node workflow
##########################################

In this exercise we will run an application workflow dedined by two nodes, passing outputs from the first as inputs to the second, and finally publishing the workflow results on HDFS.   

Prerequisites
=============

* You have cloned the Hands-On git repository (see :ref:`hands-on-repo`),
* *(Only for python)* You have installed the required software (see :ref:`python-reqs`).

Install the Hands-On
====================

* Install the Hands-On Exercise 6, just type:

.. code-block:: console

  cd
  cd dcs-hands-on
  mvn clean install -D hands.on=6 -P bash
  
Note: this instalation is using the ImageMagick [#f1]_ tools to perform image manipulations. 

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

  ciop-run -n

You will see:

.. code-block:: console-output

  node_expression
  node_binning

* Run the node *node_expression*:

.. code-block:: console

  ciop-run node_expression

* Run the node *node_binning*:

.. code-block:: console

  ciop-run node_binning

The output will be similar to:

.. code-block:: console-output

  2016-01-19 17:01:03 [WARN ] -  -- WPS needs at least one input value from your application.xml (source or parameter with scope=runtime);
  2016-01-19 17:01:04 [INFO ] - Workflow submitted
  2016-01-19 17:01:04 [INFO ] - Closing this program will not stop the job.
  2016-01-19 17:01:04 [INFO ] - To kill this job type:
  2016-01-19 17:01:04 [INFO ] - ciop-stop 0000025-160119102214227-oozie-oozi-W
  2016-01-19 17:01:04 [INFO ] - Tracking URL:
  2016-01-19 17:01:04 [INFO ] - http://sb-10-16-10-50.dev.terradue.int:11000/oozie/?job=0000025-160119102214227-oozie-oozi-W

  Node Name     :  node_binning
  Status        :  OK

  Publishing results...

  2016-01-19 17:02:56 [INFO ] - Workflow completed.
  2016-01-19 17:02:56 [INFO ] - Output Metalink: http://sb-10-16-10-50.dev.terradue.int:50070/webhdfs/v1/ciop/run/hands-on-6/0000025-160119102214227-oozie-oozi-W/results.metalink?op=OPEN

Check in these logs how the job definition is ran as a Hadoop Streaming MapReduce task.
A MapReduce job usually splits the input source so that independent data chunks are processed by the map tasks in a completely parallel manner.
The Hadoop framework takes care of tasks scheduling & monitoring, and re-executes the failed tasks.

* Run the entire workflow:

.. code-block:: console

  ciop-run

* Follow the execution until it ends (approximately five minutes),

* To close the *ciop-run* output page, press CTRL+C.

Recap
=====

#. We added a second node (*node_binning*) to our workflow;
#. We published results as final results of the workflow;
#. We ran the added node using the *ciop-run* command;
#. We saw how a job is handled by the framework as parallel tasks, during the workflow execution;
#. We ran the entire workflow using the *ciop-run* command.

.. rubric:: Footnotes

.. [#f1] `ImageMagick <http://www.imagemagick.org/>`_