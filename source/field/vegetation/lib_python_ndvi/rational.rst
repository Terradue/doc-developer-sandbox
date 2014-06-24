Rationales for your processing chain
####################################

Data 
****

You will use the Landsat 5&7 sample products made available by the `USGS <http://www.usgs.gov/>`_ at `<http://landsat.usgs.gov/product_samples.php>`_

The list of products used as test data is:

* Landsat 5 TM

  Acquired June 16, 1991: L5 TM 30-meter thermal - .tgz (175 MB)

* Acquired June 27, 1995: L5 TM 30-meter thermal - .tgz (171 MB)

* Landsat 7 ETM+

  Acquired August 17, 1999: L7 ETM+ 30-meter thermal - .tgz (316 MB)

* Acquired April 22, 2009: L7 ETM+ 30-meter thermal - .tgz (274 MB)

Software and COTS
*****************

GDAL and GDAL Python
--------------------

You will use GDAL [#f1]_ to:

* pre-process each of the Landsat sample products to convert from a multi GeoTIFF files to a single ERDAS .img product 

and GDAL Python libraries [#f2]_ to: 

* implement a Python module to calculate the NDVI GeoTIFF 

.. [#f1] `GDAL Geospatial Data Abstraction Library <http://www.gdal.org/>`_

.. [#f2] `GDAL Geospatial Data Abstraction Library Python package <https://pypi.python.org/pypi/GDAL/>`_
