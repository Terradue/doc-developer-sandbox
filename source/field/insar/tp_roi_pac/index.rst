Two pass processing with ROI_PAC
================================

This application processes a pair of Envisat ASAR data with ROI_PAC (Repeat Orbit Interferometry PACkage), a software package created by the Jet Propulsion Laboratory division of NASA and CalTech for processing SAR images to create InSAR images, named interferograms. 

This geodetic method uses two or more synthetic aperture radar (SAR) scenes to generate maps of surface deformation or digital elevation models, using differences in the phase of the waves returning to the radar sensor. The technique can potentially measure centimetre-scale changes in deformation over spans of days to years. It has applications for geophysical monitoring of natural hazards, for example earthquakes, volcanoes and landslides, and in structural engineering, in particular monitoring of subsidence and structural stability.

Read more about `ROI_PAC on Wikipedia <http://en.wikipedia.org/wiki/ROI_PAC>`_.

This filed guide has a two-fold objective:

* Implement a Web Processing Service to generate an interferogram using ROI_PAC:
  * Generate a Digital Elevation Model (DEM) 
  * Get the Envisat ASAR auxiliary and orbital data
  * Generate the interferogram
* Demonstrate how to use an external WPS service
  * The DEM generation is invoked as a node of the processing workflow 

.. Contents:

.. toctree::
   :maxdepth: 1
   
..  What you will learn <learn>
..   Addressing a scientific and processing goal <goal>
..   Rationales for the processing chain <rational>
..   Data preparation <data>
..  Workflow design <workflow>
..   Processing nodes design <nodes>
..   Application integration and testing <testing>
..   Application exploitation <exploitation <exploitation>
..   Going further <further>
