Workflow design
===============

Data 
****

You will use Envisat MERIS Level 1 Reduced Resolution, a few orbit passes acquired in April 2012.

The list of products used as test data is:

.. code-block:: bash

  MER_RR__1PRLRA20120407_112751_000026243113_00253_52853_0364.N1
  MER_RR__1PRLRA20120406_102429_000026213113_00238_52838_0211.N1
  MER_RR__1PRLRA20120405_174214_000026213113_00228_52828_0110.N1
  MER_RR__1PRLRA20120405_142147_000026243113_00226_52826_0090.N1
  MER_RR__1PRLRA20120405_092107_000026213113_00223_52823_0052.N1
  MER_RR__1PRLRA20120404_231946_000026213113_00217_52817_9862.N1
  MER_RR__1PRLRA20120404_181906_000026213113_00214_52814_9818.N1
  MER_RR__1PRLRA20120404_131826_000026213113_00211_52811_9783.N1
  MER_RR__1PRLRA20120404_113812_000026213113_00210_52810_9773.N1
  MER_RR__1PRLRA20120404_095759_000026213113_00209_52809_9767.N1

Software and COTS
*****************

ESA BEAM toolbox
----------------

You will use the ESA BEAM Toolbox [#f1]_ to implement an FLH processor to be used with BEAM Graph Processing Framework (GPF) [#f2]_.

The FLH processor is implemented using BEAM Java API and is then invoked to process the MERIS Level 1 products of the test dataset

BEAM is an open-source toolbox and development platform for viewing, analyzing and processing of remote sensing raster data. Originally developed to facilitate the utilization of image data from Envisat's optical instruments, BEAM now supports a growing number of other raster data formats such as GeoTIFF and NetCDF as well as data formats of other EO sensors such as MODIS, AVHRR, AVNIR, PRISM and CHRIS/Proba. Various data and algorithms are supported by dedicated extension plug-ins.
BEAM Graph Processing Tool (gpt) is a tool used to execute BEAM raster data operators in batch-mode. The operators can be used stand-alone or combined as a directed acyclic graph (DAG). Processing graphs are represented using XML.

With this tutorial, you will write your own BEAM operator and apply to MERIS Level 1 data.

This tutorial is based on the BEAM Tutorial held at the Sentinel-3 OLCI/SLSTR and MERIS/(A)ATSR workshop2012 by Brockmann Consult [#f3]_. 

Implementing the FLH Operator
-----------------------------

The implementation of the FLH Operator is described in [#f4]_.

Workflow structure
------------------

The workflow contains a single processing step to process the MERIS Level 1b data with the FLH processor implemented:

.. uml::

  !define DIAG_NAME Workflow example

  !include includes/skins.iuml

  skinparam backgroundColor #FFFFFF
  skinparam componentStyle uml2

  start

  :node_flh;
  
  stop

.. [#f1] `ESA BEAM Toolbox <http://www.brockmann-consult.de/cms/web/beam/>`_
.. [#f2] `ESA BEAM Graph Processing Framework (GPF) <http://www.brockmann-consult.de/beam/doc/help/gpf/GpfOverview.html>`_
.. [#f3] `Brockmann Consult <http://www.brockmann-consult.de/>`_
.. [#f4] `ESA BEAM Programming tutorial (pdf) <http://www.brockmann-consult.de/beam/tutorials/ESRINWorkshop2012/BEAM_Programming_Tutorial_20121018.pdf>`_
