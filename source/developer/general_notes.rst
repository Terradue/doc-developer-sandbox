.. _general_notes:

General Notes
#############

The Terradue's Developer Cloud Sandbox, for brevity only Sandbox, is a Virtual Machine (VM) running the CentOS 6.5 Linux distribution. This VM has the complete set of tools of the CIOP framework (the 'ciop' command line tools). Furthermore it has CDH (Cloudera's Distribution of Apache Hadoop) installed in Pseudo-Distributed mode. Pseudo-distributed mode is a method of running Hadoop whereby all Hadoop daemons run on the same machine. It is a cluster consisting of a single machine. It works just like a larger cluster, the only key difference (apart from the speed, of course!) being that the block replication factor is set to 1 (normally in a Hadoop Cluster the blocks on HDFS have a replication factor of 3). 

Getting started
^^^^^^^^^^^^^^^^

* The Sandbox is set to automatically login as the user *<your_username>*. Please refer to the section :ref:`<../start/sandbox>`, to connect to your Sandbox.

Working with the Sandbox
^^^^^^^^^^^^^^^^^^^^^^^^

* In some command-line steps in the exercises, you will see lines like this:

.. code-block:: bash

 $ ciop-simjob -n node_expression
 
The dollar sign ($) at the beginning of each line indicates the Linux shell prompt. The actual prompt will include additional information (e.g. *[user@sb-10-15-10-10.terradue.int]$* ) but it is omitted from these instructions for brevity. 

* You can install the software you need by using the *yum* command since the user *<your username>* has sudo privileges:

.. code-block:: bash

 $ sudo yum install <package name>
 
Final remark
^^^^^^^^^^^^

As the exercises progress and you gain more familiarity with the CIOP framework, the Hadoop and the MapReduce, we provide fewer step by step instructions. You feel free to ask to us for explainations or doubts using our Support Site https://support.terradue.com. We'll be happy to help !
 
