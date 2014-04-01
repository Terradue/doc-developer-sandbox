ciop-appcheck (7)
=================

Synopsis
--------

**ciop-appcheck** [-f path]

Description
-----------

``ciop-appcheck`` checks the validity of the application descriptor file (application.xml) against the XSD schema

Options
-------

``-f file``
    application descriptor file

    allows providing a application description file instead of default
    ${\_CIOP\_APPLICATION\_PATH}/application.xml

Exit Status
-----------

``ciop-appcheck returns``

0 the application descriptor file check is successful

1 the application descriptor file is not found

Examples
--------

.. code-block:: bash

  ciop-appcheck
                
.. code-block:: bash

  ciop-appcheck -f /tmp/test.xml
                

See Also
--------

:doc:`ciop-package <ciop-package>`

Author
------

Terradue
