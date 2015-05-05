Getting started with Cioppy
===========================

Installation procedure
----------------------

Hereafter the basic steps needed to install anaconda and cioppy:

To install anaconda:

.. code-block:: bash

  sudo yum install -y miniconda-3.8.3

To see the python version:

.. code-block:: bash

   export PATH=/opt/anaconda/bin/:$PATH
   python -V
   Python 2.7.9 :: Continuum Analytics, Inc.


To install cioppy:

.. code-block:: bash

   sudo conda install cioppy

To search a python package:

.. code-block:: bash

   sudo conda search <package>

Usage
-----

To use the Anaconda's version of python use the following shebang in your Python scripts:

.. code-block:: python

   #!/opt/anaconda/bin/python

Example
-------

.. code-block:: python

   #!/opt/anaconda/bin/python

   import cioppy
   ciop = cioppy.Cioppy()

.. NOTE::

   For this point, we are working to enable the usage at Runtime of the #!/usr/bin/env python shebang.
