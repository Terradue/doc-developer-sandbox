Data preparation
================

The data preparation step foresees:

* copying the Landsat sample products to the Sandbox
* the conversion of the multiple GeoTFF files that compose a Landsat product into a single ERDAS .img product
* copying the ERDAS .img products to the Laboratory S3 storage
* registering the ERDAS .img products in the Sandbox local catalogue

Copying Landsat sample products to the Sandbox
**********************************************

Log on the Sandbox shell and run:

.. code::bash

  curl http://landsat.usgs.gov/documents/L5_30m19910616.tgz | tar xvfz -
  curl http://landsat.usgs.gov/documents/L5_30m19950627.tgz | tar xvfz -
  curl http://landsat.usgs.gov/documents/L7_30m19990817.tgz | tar xvfz -
  curl http://landsat.usgs.gov/documents/L7_30m20090422.tgz | tar xvfz -

This will download and extract the files from the compressed archives.

Format conversion
*****************

Use GDAL to convert the several GeoTIFF files (one for each Landsat band) to ERDAS .img format by creating a GDAL Virtual Format [#f1]_

On the Sandbox shell run the command:

.. code-block:: bash

  
  
 ciop-catcp -m byval "http://catalogue.terradue.int/catalogue/search/MER_RR__1P/rdf?start=2012-04-05T10:00:00&stop=2012-04-08"

That will copy the Envisat MERIS Level 1 acquisitions available on Terradue catalogue to the local sandbox filesystem and catalogue.


To check the registered data and its accessibility go back to the sandbox catalogue web interface and click the Search button. The graphical interface will show the data now available on the sandbox.
Click on one product of the list on the left and then on the Access tab below the map. Finally click on the HTTP URL. The download of the select MERIS Level 1 product starts.

Copy the link to the selected MERIS file, go back to the sandbox shell and type

.. code-block:: bash

 cd 
 ciop-copy -o ./ http://localhost/data/MER_RR__1PRLRA20120407_112751_000026243113_00253_52853_0364.N1

This will copy the MER_RR__1PRLRA20120407_112751_000026243113_00253_52853_0364.N1 product from the sandbox to the home folder.

The ciop-copy [#f2]_ utility does more than simpy copying HTTP URLs, it can also consume the catalogue entry RDF URL as input. 
Go back to the web interface, and click on Metadata tab, and on the RDF logo. This will open the MERIS product catalogue entry in the RDF format. Copy that URL and use it as argument to ciop-copy:

.. code-block:: bash

 cd
 ciop-copy -o ./ http://localhost/catalogue/sandbox/MER_RR__1P/MER_RR__1PRLRA20120407_112751_000026243113_00253_52853_0364.N1/rdf
 
There is now test data on the sandbox! 

.. rubric:: Footnotes

.. [#f1] `GDAL Virtual format <http://www.gdal.org/gdal_vrttut.html>`_
