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
-----------------

The first node of the DAG with the unique identifer set to *node_flh* instantiates the :doc:`flh-proc <node/flh-proc>` job template.

.. literalinclude:: ./src/src/main/app-resources/application.xml
  :language: xml
  :tab-width: 1
  :lines: 19-32

As source, this node uses the sandbox catalogue:

.. literalinclude:: ./src/src/main/app-resources/application.xml
  :language: xml
  :tab-width: 1
  :lines: 24-26

As parameters, it defines the values for the start and enddate and leaves the expression default value.

.. literalinclude:: ./src/src/main/app-resources/application.xml
  :language: xml
  :tab-width: 1
  :lines: 27-30

The complete node *node_flh* definition is:

.. literalinclude:: ./src/src/main/app-resources/application.xml
  :language: xml
  :tab-width: 1
  :lines: 22-31

Workflow
--------

The complete workflow is:

.. literalinclude:: ./src/src/main/app-resources/application.xml
  :language: xml
  :tab-width: 1
  :lines: 19-32

Testing the application
-----------------------

Application installation
^^^^^^^^^^^^^^^^^^^^^^^^

First configure your Sandbox to use Java 7:

.. code-block:: bash

  sudo yum install -y java-1.7.0-openjdk

Select Java 7

.. code-block:: bash

  sudo /usr/sbin/alternatives --config java
  
This will show on the terminal window:

.. code-block:: bash

  There are 3 programs which provide 'java'.
  
    Selection    Command
  -----------------------------------------------
   + 1           /usr/java/jdk1.6.0_35/jre/bin/java
     2           /usr/lib/jvm/jre-1.5.0-gcj/bin/java
  *  3           /usr/lib/jvm/jre-1.7.0-openjdk.x86_64/bin/java
  
  Enter to keep the current selection[+], or type selection number:

Select java 1.7 out of the menu options by typing the correct number (here it's *3*).

All the application resources are available on the GitHub repository: https://github.com/Terradue/dcs-beam-flh-java

To install the application clone the repository on the sandbox in your home folder:

.. code-block:: bash

  cd ~
  git clone git@github.com:Terradue/dcs-beam-flh-java.git
  cd dcs-beam-flh-java

Update the Application descriptor file to use the Sandbox catalogue with the data you've copied:

.. code-block:: bash

  vi src/main/app-resources/application.xml

And change the source from:

.. code-block:: xml

  <sources>
    <source refid="cas:series">http://catalogue.terradue.int/catalogue/search/MER_RR__1P/description</source>
  </sources>

To:

.. code-block:: xml

  <sources>
    <source refid="cas:series">http://localhost/catalogue/sandbox/MER_RR__1P/description</source>
  </sources>

Then build the BEAM FLH Java processor and the application resources with:

.. code-block:: bash

  mvn install
  
The maven command will:

* Copy the application resources files from ~/dcs-beam-flh-java/src/main/app-resources to /application
* Retrieve from BEAM website all the Java artifacts required to run BEAM
* Compile the FLH Operator Java files and resources and place the compiled libraries in the correct location 

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

All dependencies are listed in the pom.xml and downloaded during the mvn install execution.

Simulating the application execution
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  
There are two approaches to test an application. 

The first manually invokes each of the nodes with the ciop-simjob [#f1]_ command line utility.

The second triggers the automatic execution of the workflow with the ciop-simwf [#f2]_ command line utility.
  
Both approaches are shown below.

Testing manually the workflow with ciop-simjob
----------------------------------------------

List the node of a workflow:

.. code-block:: bash

  ciop-simjob -n
  
This command returns:

.. code-block:: bash

  node_flh

Trigger the execution of the node_flh with:

.. code-block:: bash

  ciop-simjob -f node_flh
  
The node_flh will produce one tiff image file per input Envisat MERIS Level 1 product.

These files are all available in sandbox the distributed filesystem and the output of the ciop-simjob execution provides the URLs to explore this filesystem. 

Testing the workflow automatic execution with ciop-simwf
--------------------------------------------------------

.. code-block:: bash

  ciop-simwf
  
Wait for the workflow execution.

.. rubric:: Footnotes

.. [#f1] :doc:`ciop-catcp man page </reference/man/ciop-simjob>`
.. [#f2] :doc:`ciop-copy man page </reference/man/ciop-simwf>`
