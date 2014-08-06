opensearch-client
=================

Synopsis
--------

**opensearch-client** [options...] [url1,url2,url3,...] [metadatapath1,metadatapath2,...]

Description
-----------

``opensearch-client`` retrieves datasets from an OpenSearch Catalogue.

Options
-------

``-p/--parameter <param>``
    specify a parameter for the query.

``-o/--output <file>``
    write output to <file> instead of stdout.

``-f/--format <format>``
    specify the output format of the query. Format available can be listed with --list-osee. Default: Atom

``-to/--time-out <file>``
    specify query timeout (millisecond)

``-pagination``
    specify the pagination number for search loops. Default: 20

``--list-osee``
    list the OpenSearch Engine Extensions

``-v|--verbose``
    make the operation more talkative

Exit Status
-----------

``opensearch-client`` command exits

0 on success, and >0 if an error occurs

Examples
--------

.. code-block:: bash

    opensearch-client -f Rdf -p time:start=2012-04-04 -p time:end=2012-04-06 -p geo:box=-12.66,49.27,5.45,60.15 http://catalogue.terradue.int/catalogue/search/MER_RR__1P/description

See Also
--------

:doc:`ciop-catcp <ciop-catcp>`

Author
------

Terradue
