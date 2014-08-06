ciop-getparam (3)
=================

**ciop-getparam** [parameter name]

Description
-----------

``ciop-getparam`` For a given parameter name ciop-getparam returns its
value defined at job template level (to retrieve its default value), or
defined at workflow level (to override the default value of the
jobtemplate). If defined the workflow value has priority over the job
template value.

Options
-------

``parameter``
    the name of the parameter

Output
------

ciop-param returns the value of the parameter.

Exit Status
-----------

``ciop-param`` command exits

0 when successful

1 when the provided parameter name is not found in the job template
section nor in the workflow section the the application descriptor file
(application.xml)

Examples
--------

.. code-block:: bash

  ciop-getparam('bbox')
                    

Author
------

Terradue
