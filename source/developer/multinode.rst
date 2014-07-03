.. _multinode:

Hands-On Exercise 6: a multi-node workflow
##########################################

In this exercise we will use create a workflow with two nodes, passing inputs from first to the second and finally publishing the workflow results on HDFS.   

Prepare the application.xml
===========================

* Modify the application.xml in this way:

.. literalinclude:: src/multinode/application.xml
     :language: xml
     :tab-width: 2

We added a second node named *node_binning* and we declared that its source is the node_expression. Actually we concatenated the two nodes:  

.. literalinclude:: src/multinode/application.xml
     :language: xml
     :tab-width: 2
     :lines: 49-54

Prepare the run executable
===========================

* Now we have to prepare the run executable for the node_binning:   

.. code-block:: console

  cd $_CIOP_APPLICATION_PATH
  mkdir binning
  chmod +x binning/run

* Open the file *binning/run* and paste the following code:

.. literalinclude:: src/multinode/binning/run
      :language: bash
      :tab-width: 2

Run and debug the workflow
==========================

* Run the node *node_binning*:

.. code-block:: console

  ciop-simjob node_binning


* Check the output of the command *ciop-simjob node_binning*. It will be similar to:

TBD

* Run the entire workflow:

.. code-block:: console

  ciop-simwf

* Check the output of the command *ciop-simwf*. It will be similar to:

TBD

Recap
=====

TBD

Files used in this Hands-On
===========================

* :download:`application.xml <src/multinode/application.xml>`
* :download:`inputs/list <src/stagedata/list>`
* :download:`expression/run <src/parameters/expression/run>`
* :download:`binning/run <src/multinode/binning/run>`
