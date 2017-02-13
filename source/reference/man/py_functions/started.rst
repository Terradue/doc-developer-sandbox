Getting started with Cioppy
===========================

Installation procedure
----------------------

Hereafter, you will find the basic steps needed to install anaconda (esp. the Conda package manager tool for Python) and cioppy:

To install anaconda:

.. code-block:: console

  sudo yum install -y miniconda

To see the python version:

.. code-block:: console

   export PATH=/opt/anaconda/bin/:$PATH
   python -V
   Python 2.7.9 :: Continuum Analytics, Inc.


To install cioppy:

.. code-block:: console

   sudo conda install cioppy

To search for a Python package:

.. code-block:: console

   sudo conda search <package>

To install a Python package

.. code-block:: console

   sudo conda install <package>


Usage
-----

To use the Anaconda's version of Python, use the following shebang in your Python scripts:

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
