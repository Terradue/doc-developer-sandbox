.. _general_notes:

General Notes
#############

The Sandbox, short of *Terradue's Developer Cloud Sandbox*, is a Virtual Machine (VM) running the CentOS 6.x Linux distribution. This VM has the complete set of tools of the CIOP framework (the 'ciop' command line tools). Furthermore it has CDH (Cloudera's Distribution of Apache Hadoop) installed in Pseudo-Distributed mode [#f1]_. 

.. _hands-on-repo:

Clone the Hands-On repository
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In order to have the code locally available on your Sandbox, you have to clone the Hands-On git repository available on the `Terradue's Github <https://github.com/Terradue>`_ organization. To do so just:

* Log on your Sandbox (see :doc:`Connect to your Sandbox <../start/sandbox>`)

* Type:

.. code-block:: console

  cd
  git clone https://github.com/Terradue/dcs-hands-on.git

.. admonition:: Congrats

  You have now the resources needed to complete all the Hands-On !


Programming languages
^^^^^^^^^^^^^^^^^^^^^

The Hands-On exercises are implemented with 2 different languages: bash and python. You can choose which language to use. All the Hands-On exercises relate to bash by default, but you can choose to use python, and the behaviour will not change.

* For example, for the Hands-On 1, to select bash type:

.. code-block:: console
  
  mvn clean install -D hands.on=1 -P bash

* For the same Hands-On, to select python type:

.. code-block:: console
  
  mvn clean install -D hands.on=1 -P python

.. _python-reqs:

Prerequisites when using python
*******************************

If you want to select python as programming language for the Hands-On exercises, you have to install the Anaconda distribution and the *cioppy* package. To do that just type:

.. code-block:: console

 sudo yum install -y miniconda-3.8.3
 sudo conda install -y cioppy

Using the code examples
^^^^^^^^^^^^^^^^^^^^^^^^

* In some command-line steps in the exercises, you will see lines like this:

.. code-block:: console

 ciop-run my_node
 
The dollar sign ($) at the beginning of each line indicates the Linux shell prompt. The actual prompt will include additional information (e.g. *[user@sb-10-15-10-10.terradue.int]$* ) but it is omitted from these instructions for brevity. 

* If not otherwise specified, all the commands of these Hands-On refer to the $_CIOP_APPLICATION_PATH path:

.. code-block:: console

  echo $_CIOP_APPLICATION_PATH

.. code-block:: console-output

  /application

* Sometimes the Hands-On refer to the variable *$HOSTNAME*. To obtain its value type:

.. code-block:: console

  echo $HOSTNAME

The output will be similar to:

.. code-block:: console-output

  sb-xx-xx-xx-xx.lab.terradue.int

Install additional software
^^^^^^^^^^^^^^^^^^^^^^^^^^^

* You can install the software you need by using the *yum* command since the user *<sandbox_user>* has sudo privileges for *yum*:

.. code-block:: console

 sudo yum install <package name>
 
* You can also install the Python packages you need by using the *conda* command since the user *<sandbox_user>* has sudo privileges for *conda*:

.. code-block:: console

 sudo conda install <package name>
 
.. NOTE::
  As the exercises progress and you gain more familiarity with the CIOP framework, the Hadoop and the MapReduce, we provide fewer step by step instructions. You feel free to ask to us for explainations or doubts using our Support Site https://support.terradue.com. We'll be happy to help !

.. [#f1] Pseudo-distributed mode is a method of running Hadoop whereby all Hadoop daemons run on the same machine. It is a cluster consisting of a single machine. It works just like a larger cluster, the only key difference (apart from the speed, of course !) being that the block replication factor is set to 1 (normally in a Hadoop Cluster the blocks on HDFS have a replication factor of 3).