Field Guide
###########

The field guide contains application examples organized by thematic areas. 

Each application in the field guide is organized as follows:

What you will learn
-------------------

This section introduces the topics addressed in the application  

Addressing a scientific and processing goal
-------------------------------------------

This section provides a brief description of the thematic area addressed by the application.

Workflow design
---------------

This section introduces the application workflow as a Directed Acyclic Graph. In some applications the workflow is very simple and made of a single node to better address the learning goals.

Processing nodes design
-----------------------

This section breaks-down the workflow nodes and describes its design.

Application integration
-----------------------

This section shows hows the pieces fit together: workflow and nodes as defined in the framework.

Data preparation
----------------

This sections explains how test data is managed in the Sandbox as a combination of the steps:

* Copying external data to the Sandbox local storage
* Copying data available in the platform to the Sandbox local storage
* Pre-processing the data (e.g. changing the format)
* Registering the data in the Sandbox local catalogue

Application testing
-------------------

This section provides the guidelines on how to test the workflow nodes individually or automatically.

Application exploitation
------------------------

This section describes how to exploit the application with e.g. larger datasets.


Themes addressed in the Field Guide
+++++++++++++++++++++++++++++++++++

.. toctree::
   :maxdepth: 2
   
   Ocean colour <ocean_color/index>
   Vegetation index <vegetation/index>
   InSAR interferometry <insar/index>
   Digital Elevation Model <dem/index>
