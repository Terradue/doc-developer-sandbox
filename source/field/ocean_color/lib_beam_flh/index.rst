Fluorescence line height with Envisat MERIS L1b
===============================================

This tutorial is based on the ESA BEAM Toolbox FLH Operator tutorial [#f1]_ and has two-fold objective:

* Implement a BEAM processor using Java that:

  * Create a new product object from scratch
  * Add a Fluorescence Line Height (FLH) band object to the product object
  * Compute FLH pixels for the new band
  * Write a data product in a specific data format

* Implement a Developer Cloud Service application that runs the BEAM FLH processor against Envisat MERIS L1b data. 

Contents:

.. toctree::
   :maxdepth: 1
   
   What you will learn <learn>
   Addressing a scientific and processing goal <goal>
   Rationales for the processing chain <rational>
   Data preparation <data>
   Workflow design <workflow>
   Processing nodes design <nodes/index>
   Application integration and testing <testing>
   Application exploitation <exploitation>
   Going further <further>

.. [#f1] `ESA BEAM Programming tutorial (pdf) <http://www.brockmann-consult.de/beam/tutorials/ESRINWorkshop2012/BEAM_Programming_Tutorial_20121018.pdf>`_
