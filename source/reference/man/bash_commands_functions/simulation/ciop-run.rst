ciop-run
========

Synopsis
--------

**ciop-stop** [-a] [-l] [Job ID]

Description
-----------

ciop-stop kills a RUNNING Oozie job.


Options
-------

``Job ID Parameter``
  This must be the ID of the RUNNING Job to be killed. If no Job ID is specified, the last one is killed.

``[-a]``
  kill all the RUNNING Jobs

``[-l]``
  list all the RUNNING Jobs

Exit Status
-----------

``ciop-stop`` command exits with

0           Job killed successfully or no RUNNING Job found
255         invalid options are provided
any other exit code is from the executable itself

Examples
--------

.. code-block:: bash

  ciop-stop -a
      
.. code-block:: bash

  ciop-stop 0000267-150209145053100-oozie-oozi-W

Author
------

Terradue
