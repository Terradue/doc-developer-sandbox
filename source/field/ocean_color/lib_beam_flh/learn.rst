What you will learn
===================

1. To manage test data in a sandbox - you will copy Envisat MERIS Level 1 Reduced Resolution data to the sandbox
2. To create a BEAM Toolbox Java processor - you will implement the fluorescence line height processor using the BEAM Java API
3. To create an application invoking the fluorescence line height processor
4. To test the application - you will execute the node and workflow and inspect the results
5. To exploit the application - you will create the Web Processing Service (WPS) interface and invoke it

Where is the code
+++++++++++++++++

The code for this tutorial is available on GitHub repository `BEAM Java Tutorial <https://github.com/Terradue/BEAM-Java-tutorial>`_.

To deploy the tutorial on a Developer Sandbox:

.. code-block:: bash
  cd ~
  git clone git@github.com:Terradue/BEAM-Java-tutorial.git
  cd BEAM-Java-tutorial
  mvn install
  
This will build the application (including the Java classes of the FLH processor) on the /application volume.

The code can be modified by forking the repository here: `<https://github.com/Terradue/BEAM-Java-tutorial>`_
