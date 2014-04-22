Processing nodes & parallelisme
===============================

As introduced in the workflow section, the processing nodes are the edges of a Directed Acyclic Graph and they can be run in parallel.

This section explains what can be don within a processing node.

The processing node can be executed as several processing tasks or a single processing task.

Several processing tasks
************************

In the previous workflow example: 

.. uml::

   !define DIAG_NAME Workflow example

   !include includes/skins.iuml

   skinparam backgroundColor #FFFFFF
   skinparam componentStyle uml2

  start

  :Node A;

  fork
    :Node B;
  fork again
    :Node C;
  end fork
    :Node D;

  stop

Let's say Node A breaks-down into several processing tasks: 

.. uml::

  !define DIAG_NAME Node A breakdown

  !include includes/skins.iuml

  skinparam backgroundColor #FFFFFF
  skinparam componentStyle uml2
   
  fork
    :Task 1;
  fork again
    :Task 2;
  fork again
    :Task ...;
  fork again
    :Task n;
  end fork

The workflow would be executed as:

.. uml::

  !define DIAG_NAME Workflow example

  !include includes/skins.iuml

  skinparam backgroundColor #FFFFFF
  skinparam componentStyle uml2

  start

  fork
    :Task 1;
  fork again
    :Task 2;
  fork again
    :Task ...;
  fork again
    :Task n;
  end fork

  fork
    :Node B;
  fork again
    :Node C;
  end fork
    :Node D;

  stop
    
Single processing task
**********************

