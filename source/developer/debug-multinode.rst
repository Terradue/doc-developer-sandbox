.. _debug-multinode:

Hands-On Exercise 7: debug a multi-node workflow
################################################

In this exercise we will see how to debug the workflow described in the exercise :doc:`a multi-node workflow <multinode>`. 
To do so, we will be using a specific Web GUI, the "Oozie Web Console".

Prerequisites
=============

* You have cloned the Hands-On git repository (see :ref:`hands-on-repo`),
* *(Only for python)* You have installed the required software (see :ref:`python-reqs`).

Install the Hands-On
====================

* Install the Hands-On Exercise 7, just type:

.. code-block:: console

  cd
  cd dcs-hands-on
  mvn clean install -D hands.on=7 -P bash

Run the workflow 
================

* Type the following command:

.. code-block:: console

  ciop-run

* Press CTRL+C 

.. warning::
  
  The workflow will continue its execution, despite the CTRL+C command.
  
Debug the workflow
==================

* Open the provided Tracking URL

* Click on the *n-node_expression* value under the column *Name*,

* Click on the lens image,

* Continue debugging as described in the exercise :doc:`make a robust workflow and debug it <debug>`,

* Click on the *n-node_binning* value under the column *Name*,

* Click on the lens image,

* Continue debugging as described in the exercise :doc:`make a robust workflow and debug it <debug>`.

The following image shows the steps that we have just performed:

.. figure:: includes/multinode-debug/gui1.png
   :scale: 80 %
   :alt: Browse results

.. figure:: includes/multinode-debug/gui2.png
   :scale: 80 %
   :alt: Browse results

.. figure:: includes/multinode-debug/gui3.png
   :scale: 80 %
   :alt: Browse results

Recap
=====

#. We executed a multi-node workflow;
#. We accessed the Oozie Web Console to debug it.
