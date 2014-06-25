Application integration and testing
===================================

Now that the node ndvi template is defined, it is now time to create the workflow with the single node.

The workflows are Directed Acyclic Graphs (DAG) where nodes and their relation(s) and the source(s) are defined.

Each node of the DAG has:

* a unique node identifier
* a job template id reference
* one or more sources
* one or more parameters and associated values to overide the default values (if defined in the job template).

The node_expression node
------------------------

The first node of the DAG with the unique identifer set to *node_expression" instantiates the :doc:`expression <node/expression>` job template.

.. literalinclude:: src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 50-51

As source, this node uses the sandbox catalogue:

.. literalinclude:: src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 52-54

As parameters, it defines the values for the start and enddate and leaves the expression default value.

.. literalinclude:: src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 55-58

The complete node *node_expression* definition is:

.. literalinclude:: src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 50-59

Testing the application
-----------------------

Application installation
^^^^^^^^^^^^^^^^^^^^^^^^

All the application files are available on a GitHub repository that can be downloaded at the URL `<https://github.com/Terradue/BEAM-Arithm-tutorial/archive/master.zip>`_. 

The archive content is extracted to /application:

.. code-block:: bash

  unzip BEAM-Arithm-tutorial-master.zip
  cd BEAM-Arithm-tutorial-master
  cp -Rv . /application 
  
Application check
^^^^^^^^^^^^^^^^^
  
The Application Descriptor file can be checked with:

.. code-block:: bash

  ciop-appcheck
  
If the Application Descriptor is valid, the output is:

.. code-block:: bash

  /application/application.xml validates
  
Installing the required packages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The application requires ESA BEAM Toolbox which is available in the sandbox software repository:

.. code-block:: bash

  sudo yum install esa-beam-4.11

R, which is also available in the software repository (it includes several packages and libraries):

.. code-block:: bash

  sudo yum install rciop
  
And finally the R fcp package for the R DBSCAN library:


Simulating the application execution
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  
There are two approaches to test an application. 

The first manually invokes each of the nodes with the ciop-simjob [#f1]_ command line utility.

The second triggers the automatic execution of the workflow with the ciop-simwf [#f2]_ command line utility.
  
Both approaches are shown below.

Testing manually the workflow with ciop-simjob
----------------------------------------------

Trigger the execution of the node_expression with:

.. code-block:: bash

  ciop-simjob -f node_expression
  
The node_expression will produce one compressed archive with the BEAM-DIMAP product per input Envisat MERIS Level 1 product:

.. code-block:: bash

  MER_RR__1PRLRA20120406_102429_000026213113_00238_52838_0211.N1.dim.tgz
  MER_RR__1PRLRA20120405_174214_000026213113_00228_52828_0110.N1.dim.tgz
  MER_RR__1PRLRA20120405_142147_000026243113_00226_52826_0090.N1.dim.tgz
  MER_RR__1PRLRA20120405_092107_000026213113_00223_52823_0052.N1.dim.tgz
  MER_RR__1PRLRA20120404_231946_000026213113_00217_52817_9862.N1.dim.tgz

These files are all available in sandbox the distributed filesystem. These are the inputs for the second node of the DAG

Run ciop-simjob for all the nodes of the DAG. 

.. code-block:: bash

  ciop-simjob -n # list the node identifiers 
  ciop-simjob -f node_arrange
  ciop-simjob -f node_binning
  ciop-simjob -f node_clustering

Testing the workflow automatic execution with ciop-simwf
--------------------------------------------------------

.. code-block:: bash

  ciop-simwf
  
Wait for the workflow execution.

.. rubric:: Footnotes

.. [#f1] :doc:`ciop-catcp man page </reference/man/ciop-simjob>`
.. [#f2] :doc:`ciop-copy man page </reference/man/ciop-simwf>`
