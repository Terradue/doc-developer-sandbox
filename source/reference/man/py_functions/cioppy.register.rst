register
========

Description
-----------

Registers the metadata of a product in a catalogue (e.g. the sandbox internal catalogue)

Usage
-----

.. code-block:: python

  import cioppy
  ciop = cioppy.Cioppy()

  ciop.register (end_point, series_url, elements)

Arguments
---------

``end_point``
  the URL of the OpenSearch catalogue end point

``series_url``
  the URL to the series template

``elements``
  array of metadata fields

Details
-------

This function inserts a catalogue entry

Value
-----

List with:

* exit.code: 0 if succesful, >0 if unsuccessful

Examples
--------

.. code-block:: python

  pub = ciop.publish('/tmp/myfile.tif')

  metadata = [ "ical:dtstart=2001-01-10T14:00:00",
                "ical:dtend=2001-01-10T14:05:00",
                "dc:identifier=mydataset",
                "dct:spatial=MULTIPOLYGON(((25.55215 36.97701,24.740512 37.091395,24.496927 35.950137,25.284346 35.839142,25.55215 36.97701)))",
                "dclite4g:onlineResource=" + pub[0].rstrip()]

  ciop.register('http://localhost/catalogue/sandbox/rdf',
                    'file:///application/pyjob/etc/series.rdf',
                    metadata)

Author
------

Terradue
