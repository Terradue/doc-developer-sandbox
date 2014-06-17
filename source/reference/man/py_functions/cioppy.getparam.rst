getparam
========

Description
-----------

Returns the value of the parameter as character

Usage
-----

.. code-block:: python

  import cioppy as ciop
  ciop.getparam (param)
  
Arguments
---------

``param``
  the name of the parameter

Details
-------

Returns the value defined at job template level for a given parameter name (to retrieve its default value), or defined at workflow level (to override the default value of the jobtemplate). If defined the workflow value has priority over the job template value.

Value
-----

value of the parameter as character

Examples
--------

.. code-block:: bash

  myvar = ciop.getparam('param1')

Author
------

Terradue
