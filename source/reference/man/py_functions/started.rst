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

To search for a Python package:

.. code-block:: bash

   sudo conda search <package>

To install a Python package 

.. code-block:: bash

   sudo conda install <package>


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

   We are working on enabling the usage of the classical #!/usr/bin/env Python shebang.
