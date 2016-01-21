.. _parameters:

Hands-On Exercise 5: using parameters
#####################################

In this exercise we will study the usage of parameters in the workflow.   

Prerequisite
=============

* You have cloned the Hands-On git repository (see :ref:`hands-on-repo`).

Install the Hands-On
====================

* Install the Hands-On Exercise 5, just type:

.. code-block:: console

  cd
  cd dcs-hands-on
  mvn clean install -D hands.on=5 -P bash

Inspect the application.xml
===========================

* Checking the updated *application.xml*, you will see now the parameter *expression*:

.. container:: context-application-descriptor-file

  .. literalinclude:: src/dcs-hands-on/src/main/app-resources/hands-on-5/application.xml
       :language: xml
       :tab-width: 2

Inspect the run executable
==========================

* Open the file *expression/run* and search for the lines containing the function *ciop-getparam*:

.. container:: context-run-executable

  .. literalinclude:: src/dcs-hands-on/src/main/app-resources/hands-on-5/bash/expression/run
        :language: bash
        :tab-width: 2
        :lines: 100-104


Run and debug the workflow
==========================

* Run the node *node_expression*:

.. code-block:: console

  ciop-run node_expression

* Check the output of the application by copying the Tracking URL from the *ciop-run* command, and paste it in a browser (see :doc:`make a robust workflow and debug it <debug>`). You will see an output similar to:

.. figure:: includes/parameters/gui1.png
     :scale: 55 %
     :alt: Attempts output

Recap
=====

#. We added a parameter in the job template of a processing node, defined in the application workflow;
#. We used the value of that parameter in our run executable.
