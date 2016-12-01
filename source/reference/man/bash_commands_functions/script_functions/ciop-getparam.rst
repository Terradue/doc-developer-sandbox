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

ciop-getparam returns either the value of the parameter or an empty string.


Examples
--------

.. code-block:: bash
	
  local bbox = "$( ciop-getparam bbox )"
                    

Author
------

Terradue
