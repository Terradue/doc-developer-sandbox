Application integration
=======================

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
