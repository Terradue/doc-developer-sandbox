Streaming executable design patterns
====================================

A processing task triggers the execution of a streaming executable.

The streaming executable reads the inputs via the stdin channel as if one would do:

.. code-block:: bash

 $ echo "file1\nfile2" | myExecutable
 
This section defines typical design patterns which include:
* sourcing the required libraries (bash, R are available; Python in development)
* get parameter values
* reading the stdin
* stage-in/out
* apply user processing

There are two standard design patterns:
* Process n inputs to generate n (or m) outputs (parallel)
* Process n inputs to generate one output (aggregation)

And there auxiliary nodes that do not process the inputs but arrange and/or combine them for subsequent nodes in the workflow.

Process n inputs and generate n (or m) outputs
**********************************************

This design pattern processes inputs independently from one another. There will several processing task processing a number of inputs each.

The typical structure of such a streaming executable is:

.. uml::

  !define DIAG_NAME Workflow example

  !include includes/skins.iuml

  skinparam backgroundColor #FFFFFF
  skinparam componentStyle uml2

  start

  :Source libraries;
  
  :Get parameter values;
  
  while (read stdin line)
    :Stage-in data
    :Apply user application
    :Stage-out result
  endwhile
  
  stop

Process n inputs to generate one output
***************************************

This design pattern processes all inputs to generate the result. There will one single processing task processing all the inputs.

The typical structure of such a streaming executable is:

.. uml::

  !define DIAG_NAME Workflow example

  !include includes/skins.iuml

  skinparam backgroundColor #FFFFFF
  skinparam componentStyle uml2

  start

  :Source libraries;
  
  :Get parameter values;
  
  while (read stdin line)
    :Stage-in data
  endwhile
  
  :Apply user application
    :Stage-out result
    
  stop
