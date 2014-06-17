copy
====

Description
-----------

Copies an URL to a local folder

Usage
-----

.. code-block:: python
  
  import cioppy as ciop
  ciop.copy (urls, target, extract=TRUE)

Arguments
---------

``url``
  the URL of the product to download or the URL to the OpenSearch catalogue entry in RDF format
  
``target``
  the destination folder for the downloaed product
  
``uncompress``
  if the product is an archive (.tgz, .gz) it is extracted by default

Details
-------

This function stages-in remote files to local folders 

Value
-----

List with:

* exit.code: 0 if succesful, >0 if unsuccessful 
* output: local path of the downloaded product

Examples
--------

.. code-block:: python
  
  input <- "http://landsat.usgs.gov/documents/L7_60m20090422.tgz" 
  res = ciop.copy(input, os.environ['TMPDIR'])
  
Author
------

Terradue
