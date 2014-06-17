casmeta
=======

Description
-----------

returns the metadata value of the given field for a given product catalogue RDF URL

Usage
-----

.. code-block:: python

  import cioppy as ciop
  ciop.casmeta (field, url) 
  
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

.. code-block:: python
  
	direction = ciop.casmeta("eop:orbitDirection", input)
  
Author
------

Terradue
