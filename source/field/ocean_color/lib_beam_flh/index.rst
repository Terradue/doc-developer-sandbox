Fluorescence line height with Envisat MERIS L1b
===============================================

This tutorial is based on the ESA BEAM Toolbox FLH Operator tutorial [#f1]_ and has two-fold objective:

* Implement a BEAM processor using Java that:

  * Creates a new product object from scratch
  * Adds a Fluorescence Line Height (FLH) band object to the product object
  * Computes FLH pixels for the new band
  * Writes a data product in a specific data format

* Implement a Developer Cloud Service application that runs the BEAM FLH processor against Envisat MERIS L1b data. 

Contents:

.. toctree::
   :maxdepth: 1
   
   What you will learn <learn>
   Addressing a scientific and processing goal <goal>
   Workflow design <workflow>
   Processing nodes design <nodes/index>
   Application integration <integration>
   Data preparation <data>
   Application testing <testing>
   Application exploitation <exploitation>
   Going further <further>

.. [#f1] `ESA BEAM Programming tutorial (pdf) <http://www.brockmann-consult.de/beam/tutorials/ESRINWorkshop2012/BEAM_Programming_Tutorial_20121018.pdf>`_
