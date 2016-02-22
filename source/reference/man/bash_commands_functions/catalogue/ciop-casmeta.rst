ciop-casmeta (7)
================

Synopsis
--------

**ciop-casmeta** -f\|--field url

Description
-----------

``ciop-casmeta`` For a given metadata field and OpenSearch catalogue URL, ciop-casmeta returns the field metadata value(s).

Options
-------

``-h|--help``
    shows the ciop-casmeta help

``-f|--field``
    name of metadata field

``url``
    one or more product urls

Output
------

ciop-casmeta returns the metadata values to stdout (new line separated)

Exit Status
-----------

``ciop-casmeta`` command exits

* 0 when successful

* 1 in case of error(s)

Examples
--------

.. code-block:: bash

  ciop-casmeta -f "dct:spatial" http://eo-virtual-archive4.esa.int/search/ASA_IM__0P/ASA_IM__0CNPDE20120407_061227_000000173113_00250_52850_6352.N1/rdf
                    

.. code-block:: bash

  echo "http://eo-virtual-archive4.esa.int/search/ASA_IM__0P/rdf?count=5" | ciop-casmeta -f "ical:dtstart" -
                    

See Also
--------

:doc:`ciop-catcp <ciop-catcp>`

Author
------

Terradue
