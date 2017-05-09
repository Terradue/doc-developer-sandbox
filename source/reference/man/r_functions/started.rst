Getting started with rciop
==========================

Installation procedure
----------------------

Hereafter, you will find the basic steps needed to install anaconda (esp. the Conda package manager tool for Python and R) and rciop:

To install anaconda:

.. code-block:: console

  sudo yum install -y miniconda

Add anaconda binaries to PATH

.. code-block:: console

   export PATH=/opt/anaconda/bin/:$PATH

To install R and rciop:

.. code-block:: console

   sudo conda install -c r  r-essentials
   sudo conda install -c r -c terradue r-rciop

To search for an R package:

.. code-block:: console

   sudo conda search -c r <package>

To install an R package

.. code-block:: console

   sudo conda install -c r <package>

To install an R package from another channel

   sudo conda install -c <channel> <package>

Usage
-----

To use the Anaconda's R, use the following shebang in your R scripts:

.. code-block:: python

   #!/opt/anaconda/bin/RScript

Example
-------

.. code-block:: R

   #!/opt/anaconda/bin/Rscript

   library('rciop')
