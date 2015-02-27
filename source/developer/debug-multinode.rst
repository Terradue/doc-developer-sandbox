.. _debug-multinode:

Hands-On Exercise 7: debug a multi-node workflow
################################################

In this exercise we will see how to debug the workflow described in the exercise :doc:`a multi-node workflow <multinode>` using a specific Web GUI.   

Prerequisite
=============

* You have cloned the Hands-On git repository (see :ref:`hands-on-repo`).

Install the Hands-On
====================

* Install the Hands-On Exercise 7, just typing:

.. code-block:: console

  cd
  cd dcs-hands-on
  mvn clean install -D hands.on=7 -P bash

Run the workflow 
================

* Type the following command:

.. code-block:: console

  ciop-simwf

* Press CTRL+C

.. warning::
  
  The workflow will continue its execution, despite to the CTRL+C input.
  
Debug the workflow
==================

* Open a browser and type http://$HOSTNAME:11000

  It will present the Oozie Web Console available on the Sandbox. It provides information about the status of the workflows and the access to their logs. 

.. tip::
  
  Read how to obtain the value of $HOSTNAME in the :doc:`General Notes <general_notes>` section

* Click on the *Job Id* value,

* Click on the *n-node_expression* value under the column *Name*,

* Click on the lens image,

* Continue debugging as described in the exercise :doc:`make a robust workflow and debug it <debug>`. 

The following image show the steps that we have just performed:

.. figure:: includes/multinode-debug/gui1.png
   :scale: 80 %
   :alt: Browse results

.. figure:: includes/multinode-debug/gui2.png
   :scale: 80 %
   :alt: Browse results

.. figure:: includes/multinode-debug/gui3.png
   :scale: 80 %
   :alt: Browse results

.. figure:: includes/multinode-debug/gui4.png
   :scale: 80 %
   :alt: Browse results

Recap
=====

#. We executed a multi-node workflow, 
#. We used the Oozie Web Console to debug it.
