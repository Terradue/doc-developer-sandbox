Application integration and testing
===================================

Now that the node template has an associated job template, it is now time put it in a workflow.

The workflow is a Directed Acyclic Graphs (DAG) where nodes and their relation(s), the source(s) are defined.

This application's workflow is the simplest case: a workflow with a single node:

.. uml::

  !define DIAG_NAME Workflow example

  !include includes/skins.iuml

  skinparam backgroundColor #FFFFFF
  skinparam componentStyle uml2

  start

  :node_flh;
  
  stop

Each node of DAG has:

* a unique node identifier
* a job template id reference
* one or more sources
* one or more parameters and associated values to overide the default values (if defined in the job template).

The node_flh node
------------------------

The first node of the DAG with the unique identifer set to *node_flh* instantiates the :doc:`flh-proc <node/flh-proc>` job template.

.. literalinclude:: src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 50-51

As source, this node uses the sandbox catalogue:

.. literalinclude:: ./src/src/main/app-resources/application.xml
  :language: xml
  :tab-width: 1
  :lines: 52-54

As parameters, it defines the values for the start and enddate and leaves the expression default value.

.. literalinclude:: ./src/src/main/app-resources/application.xml
  :language: xml
  :tab-width: 1
  :lines: 55-58

The complete node *node_flh* definition is:

.. literalinclude:: ./src/src/main/app-resources/application.xml
  :language: xml
  :tab-width: 1
  :lines: 50-59

Workflow
--------

The complete workflow is:

.. literalinclude:: ./src/src/main/app-resources/application.xml
  :language: xml
  :tab-width: 1
  :lines: 48-84

Testing the application
-----------------------

Application installation
^^^^^^^^^^^^^^^^^^^^^^^^

All the application files are available on the GitHub repository: https://github.com/Terradue/BEAM-Java-tutorial

To install the application clone the repository on the sandbox in your home folder:

.. code-block:: bash

  cd ~
  git clone git@github.com:Terradue/dcs-beam-flh-java.git
  cd dcs-beam-flh-java
  mvn install
  
The maven command will:

* Copy the application resources files from ~/dcs-beam-flh-java/src/main/app-resources to /application
* Compile the FLH Operator Java files and resources and place the compiled libraries (BEAM and the FLH operator) in the correct location 

Application check
^^^^^^^^^^^^^^^^^
  
The Application Descriptor file can be checked against the schema with:

.. code-block:: bash

  ciop-appcheck
  
If the Application Descriptor is valid, the output is:

.. code-block:: bash

  /application/application.xml validates
  
Installing the required packages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The application requires ESA BEAM Toolbox to compile and run. 

All dependencies are listed in the pom.xml and downloaded during the mvn install execution

Simulating the application execution
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  
There are two approaches to test an application. 

The first manually invokes each of the nodes with the ciop-simjob [#f1]_ command line utility.

The second triggers the automatic execution of the workflow with the ciop-simwf [#f2]_ command line utility.
  
Both approaches are shown below.

Testing manually the workflow with ciop-simjob
----------------------------------------------

Trigger the execution of the node_flh with:

.. code-block:: bash

  ciop-simjob -f node_flh
  
The node_flh will produce one tiff image file per input Envisat MERIS Level 1 product.

These files are all available in sandbox the distributed filesystem.

Testing the workflow automatic execution with ciop-simwf
--------------------------------------------------------

.. code-block:: bash

  ciop-simwf
  
Wait for the workflow execution.

.. rubric:: Footnotes

.. [#f1] :doc:`ciop-catcp man page </reference/man/ciop-simjob>`
.. [#f2] :doc:`ciop-copy man page </reference/man/ciop-simwf>`
