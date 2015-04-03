.. _toolbox:

Hands-On Exercise 4: using a toolbox
#####################################

In this exercise we will use a toolbox to process the inputs of our workflow, and we will publish its results on HDFS.   

Prerequisite
=============

* You have cloned the Hands-On git repository (see :ref:`hands-on-repo`).

Install the Hands-On
====================

* Install the Hands-On Exercise 4, just type:

.. code-block:: console

  cd
  cd dcs-hands-on
  mvn clean install -D hands.on=4 -P bash

Install the BEAM Toolbox
========================

The BEAM Toolbox [#f1]_ is an open-source toolbox and development platform for viewing, analyzing and processing remote sensing raster data. 
BEAM stands for 'Basic ERS & Envisat (A) ATSR and Meris', the satellite sensor measurements handled by the toolbox.
To install the BEAM toolbox type:

.. code-block:: console

  sudo yum install -y beam-5.0
  sudo /usr/sbin/alternatives --config java

This last command will show on the terminal window close to hte subsequent one:

.. code-block:: console-output 

  There are 3 programs which provide 'java'.

   Selection     Command
  ------------------------------------------------
   + 1           /usr/java/jdk1.6.0_35/jre/bin/java
     2           /usr/lib/jvm/jre-1.5.0-gcj/bin/java
  *  3           /usr/lib/jvm/jre-1.7.0-openjdk.x86_64/bin/java

  Enter to keep the current selection[+], or type selection number:

Select java 1.7 out of the menu options by typing the correct number (here it's 3).



Inspect the application.xml
===========================

Inspect the *application.xml*, it is now slightly different from the one used in the previous hands-on exercise:

.. container:: context-application-descriptor-file

  .. literalinclude:: src/dcs-hands-on/src/main/app-resources/hands-on-4/application.xml
       :language: xml
       :tab-width: 2

Inspect the run executable
===========================

* The BEAM Toolbox has to be called within the run executable. We can inspect the run executable and see how the BEAM Toolbox is used: 

.. code-block:: console

  cd $_CIOP_APPLICATION_PATH
  more expression/run

.. HINT::
  The BEAM Toolbox is executed through the *gpt.sh* script

For further explainations on the graph processing tool, see "Bulk Processing with GPT" [#f2]_ and "Creating a GPF Graph" [#f3]_.

Run and debug the workflow
==========================

* Run the node *node_expression*:

.. code-block:: console

  ciop-simjob node_expression

* Check the output of the application by copying the Tracking URL from the *ciop-simjob* command, and paste it in a browser (see :doc:`make a robust workflow and debug it <debug>`). You will see an output similar to:

.. figure:: includes/toolbox/gui1.png
     :scale: 70 %
     :alt: Attempts output

Recap
=====

#. We installed the ESA BEAM toolbox;
#. We called it from our run executable;
#. We processed the inputs with the BandMaths Operator provided by the ESA BEAM Toolbox;
#. We published the results in HDFS.

.. rubric:: Footnotes

.. [#f1] `ESA BEAM Toolbox BandMaths <http://www.brockmann-consult.de/beam/doc/help/gpf/org_esa_beam_gpf_operators_standard_BandMathsOp.html>`_
.. [#f2] `Bulk Processing with GPT <http://www.brockmann-consult.de/beam-wiki/display/BEAM/Bulk+Processing+with+GPT>`_
.. [#f3] `Creating a GPF Graph <http://www.brockmann-consult.de/beam-wiki/display/BEAM/Creating+a+GPF+Graph>`_
