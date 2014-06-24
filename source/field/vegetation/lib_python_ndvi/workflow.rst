Workflow design
===============

The application's data pipeline activities can be defined as follows:

Use the Python NDVI package to apply the band arithmetic expression to calculate the NDVI to all Landsat products passed as references to the Sandbox catalogue.

.. uml::

  !define DIAG_NAME Workflow example

  !include includes/skins.iuml

  skinparam backgroundColor #FFFFFF
  skinparam componentStyle uml2

  start
  
  while (check stdin?) is (line)
    :Stage-in data;
    :Apply Python NDVI;
    :Stage-out ndvi_result;
    :Register ndvi_result in Sandbox catalogue;
  endwhile (empty)

  stop

This translates into a very simple workflow containing a single processing step: py-ndvi 

The simple workflow can be represented as:

.. uml::

  !define DIAG_NAME Workflow example

  !include includes/skins.iuml

  skinparam backgroundColor #FFFFFF
  skinparam componentStyle uml2

  start

  :node_ndvi;
  
  stop

The *node_ndvi* is described in details in :doc:`/field/vegetation/lib_python/nodes/index`

