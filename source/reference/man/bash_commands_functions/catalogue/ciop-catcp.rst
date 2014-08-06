ciop-catcp (7)
==============

Synopsis
--------

**ciop-catcp** [<options>] [RDF URL]

Description
-----------

``ciop-catcp`` copies series and dataset metadata of a local or remote
catalogue RDF to the local catalogue. The target dataset metadata can
keep the source dataset online resources or have new HTTP online
resources pointing to the local storage.

Options
-------

``-h|--help``
    shows the ciop-catcp help

``-m``
    byref (default) - with this mode the series and dataset metadata is
    copied to the local catalogue. The dataset online resources are the
    same as in the source catalogue

    byval - with this mode the series and dataset metadata is copied to
    the local catalogue; the dataset(s) are copied to the local storage
    and the online resources point to the local sandbox webserver

``-sec``
    if used with option -m byval, copies the data to a https location
    protected by the certificate

``-l``
    to use a local data to register

``-ws``
    exclude unwanted data access protocol (e.g. GSIFTP,HTTPS,GRIDSITE)

Exit Status
-----------

``ciop-catcp`` command exits

0 on success, and >0 if an error occurs

10 if the source catalogue RDF url could not be retrieved

15 if the series could not be inserted in the local catalogue

20 if the dataset could not be inserted in the local catalogue

Examples
--------

.. code-block:: bash

    echo "http://grid-eo-catalog.esrin.esa.int/catalogue/gpod/SAR_IM__0P/rdf?bbox=-90,-180,90,90&count=2" | ciop-catcp -m byval -
                    

.. code-block:: bash

    ciop-catcp -m byval http://eo-virtual-archive4.esa.int/search/ER01_SAR_IMP_1P/SAR_IMP_1PXASI19950429_091508_00000017G145_00279_19806_0880.E1/rdf
                    

.. code-block:: bash

    echo "http://grid-eo-catalog.esrin.esa.int/catalogue/gpod/SAR_IM__0P/rdf?bbox=-90,-180,90,90&count=2" | ciop-catcp -m byref -
                    

.. code-block:: bash

    ciop-catcp http://eo-virtual-archive4.esa.int/search/ER01_SAR_IMP_1P/rdf
                    

.. code-block:: bash

    ciop-catcp -l ./ER01_SAR_IMP_1P_19960518T091516_19960518T091533_IPA_25317_0000.ESA.tar.gz http://eo-virtual-archive4.esa.int/search/ER01_SAR_IMP_1P/SAR_IMP_1PXASI19960518_091516_00000017G156_00279_25317_0873.E1/rdf
                    

See Also
--------

:doc:`ciop-copy <../data/ciop-copy>`

Author
------

Terradue
