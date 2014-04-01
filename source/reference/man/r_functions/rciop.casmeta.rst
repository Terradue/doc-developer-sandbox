rciop.casmeta {rciop}
=====================

Description
-----------

returns the metadata value of the given field for a given product catalogue RDF URL

Usage
-----

.. code-block:: bash

  rciop.casmeta (field, url) 
  
Arguments
---------

``field``
  name of the metadata field

``url``
  the URL to the OpenSearch catalogue entry in RDF format
  
Details
-------

This function returns the value of the metadata field provided given an OpenSearch product URL in the RDF format

Value
-----

List with:

* exit.code: 0 if succesful, >0 if unsuccessful 
* output: metadata field value

Examples
--------

.. code-block:: bash
  
	direction <- as.character(rciop.casmeta("eop:orbitDirection", input)$output)
  track <- as.numeric(rciop.casmeta("eop:wrsLongitudeGrid", input)$output)
  start <- as.Date(rciop.casmeta("ical:dtstart", input)$output) 
  starttime <- as.character(rciop.casmeta("ical:dtstart", input)$output)
  wkt <- as.character(rciop.casmeta("dct:spatial", input)$output)
  
Author
------

Terradue
