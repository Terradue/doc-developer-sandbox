# Workflow design

## Data

You will use Envisat MERIS Level 1 Reduced Resolution, a few orbit passes acquired in April 2012.

MERIS was a programmable, medium-spectral resolution, imaging spectrometer operating in the solar reflective spectral range. Fifteen spectral bands can be selected by ground command.
The instrument scanned the Earth's surface by the so called "push-broom" method. Linear CCD arrays provided spatial sampling in the across-track direction, while the satellite's motion provided scanning in the along-track direction.
MERIS was designed to acquire data over the Earth whenever illumination conditions were suitable. The instrument's 68.5° field of view around nadir covered a swath width of 1150 km. This wide field of view was shared between five identical optical modules arranged in a fan shape configuration.

See {doc}`Data preparation <data>` section for details on the MERIS data used in this guide.

## Software and COTS

### ESA BEAM toolbox

You will use the ESA BEAM Toolbox [^f1] to implement an FLH processor to be used with BEAM Graph Processing Framework (GPF) [^f2].

The FLH processor is implemented using BEAM Java API and is then invoked to process the MERIS Level 1 products of the test dataset

BEAM is an open-source toolbox and development platform for viewing, analyzing and processing of remote sensing raster data. Originally developed to facilitate the utilization of image data from Envisat's optical instruments, BEAM now supports a growing number of other raster data formats such as GeoTIFF and NetCDF as well as data formats of other EO sensors such as MODIS, AVHRR, AVNIR, PRISM and CHRIS/Proba. Various data and algorithms are supported by dedicated extension plug-ins.
BEAM Graph Processing Tool (gpt) is a tool used to execute BEAM raster data operators in batch-mode. The operators can be used stand-alone or combined as a directed acyclic graph (DAG). Processing graphs are represented using XML.

With this tutorial, you will write your own BEAM operator and apply to MERIS Level 1 data.

This tutorial is based on the BEAM Tutorial held at the Sentinel-3 OLCI/SLSTR and MERIS/(A)ATSR workshop2012 by Brockmann Consult [^f3].

The implementation of the BEAM FLH Operator is described in [^f4] and summarized here:

- Create a new product object from scratch
- Add a Fluorescence Line Height (FLH) band object to the product object
- Compute FLH pixels for the new band
- Write a data product in a specific data format

### Workflow structure

The workflow contains a single processing step to process the MERIS Level 1b data with the FLH processor implemented:

```{eval-rst}
.. uml::

  !define DIAG_NAME Workflow example

  !include includes/skins.iuml

  skinparam backgroundColor #FFFFFF
  skinparam componentStyle uml2

  start

  :node_flh;

  stop
```

[^f1]: [ESA BEAM Toolbox](http://www.brockmann-consult.de/cms/web/beam/)

[^f2]: [ESA BEAM Graph Processing Framework (GPF)](http://www.brockmann-consult.de/beam/doc/help/gpf/GpfOverview.html)

[^f3]: [Brockmann Consult](http://www.brockmann-consult.de/)

[^f4]: [ESA BEAM Programming tutorial (pdf)](http://www.brockmann-consult.de/beam/tutorials/ESRINWorkshop2012/BEAM_Programming_Tutorial_20121018.pdf)
