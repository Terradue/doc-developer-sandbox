rciop.copy {rciop}
==================

Description
-----------

Copies an URL to a given folder

Usage
-----

.. code-block:: bash

  rciop.copy (url, target="./", uncompress=TRUE)

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

.. code-block:: bash
  
  input <- "http://landsat.usgs.gov/documents/L7_60m20090422.tgz" 
  res <- rciop.copy(input, TMPDIR, uncompress=TRUE)
  if (res$exit.code==0) local.url <- res$output
  
.. code-block:: bash

  local.prms <- apply(as.data.frame(prm), 1, function(url) { rciop.copy(url, TMPDIR)$output })
  tmp.df <- read.table(textConnection(local.prms)) 

Author
------

Terradue
