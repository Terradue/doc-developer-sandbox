.. _catalogue:

Hands-On Exercise 9: using an OpenSearch catalogue
###################################################

In this exercise we will use an OpenSearch [#f1]_ catalogue URL as input source of the workflow, querying the catalogue with OpenSearch parameters.   

Prepare the application.xml
===========================

* Modify the *application.xml* of the exercise :doc:`a multi-node workflow <multinode>` in this way:

.. container:: context-application-descriptor-file

  .. literalinclude:: src/catalogue/application.xml
       :language: xml
       :tab-width: 2

Note the different **source** in the *node_expression*:

.. container:: context-application-descriptor-file

  .. literalinclude:: src/catalogue/application.xml
       :language: xml
       :tab-width: 2
       :lines: 54-62

Note also the **OpenSearch parameters** defined in the jobTemplate *expression*:

.. container:: context-application-descriptor-file

  .. literalinclude:: src/catalogue/application.xml
       :language: xml
       :tab-width: 2
       :lines: 5-13

Run and debug the workflow
==========================

* Run the *node_expression*:

.. code-block:: console

  ciop-simjob node_expression

* Copy the Tracking URL and paste it in a browser,

* See the log of one of the two Tasks, as described in :doc:`make a robust workflow and debug it <debug>`. It will be similar to: 

.. figure:: includes/catalogue/gui1.png
   :scale: 80 %
   :alt: Task output

Note that the input product is now downloaded from an external catalogue, as result of an OpenSearch query.

Recap
=====

#. We used an OpenSearch catalogue as source of the first node of the workflow,
#. We defined a number of OpenSearch parameters to query the catalogue, 
#. We processed the query results in the *node_expression*.

Files used in this Hands-On
===========================

* :download:`application.xml <src/catalogue/application.xml>`
* :download:`expression/run.sh <src/parameters/expression/run.sh>`
* :download:`binning/run.sh <src/multinode/binning/run.sh>`

.. rubric:: Footnotes

.. [#f1] `OpenSearch <http://www.opensearch.org/>`_
