.. _multinode:

Hands-On Exercise 8: using an OpenSearch catalogue
###################################################

In this exercise we will use an OpenSearch [#f1]_ catalogue URL as input source of the workflow, querying the catalogue with OpenSearch parameters.   

Prepare the application.xml
===========================

* Modify the *application.xml* in this way:

.. literalinclude:: src/catalogue/application.xml
     :language: xml
     :tab-width: 2

Run and debug the workflow
==========================

* Run the *node_expression*:

.. code-block:: console

  ciop-simjob node_expression

* Copy the tracking URL --TBD

* Debug --TBD

* Run the workflow --TBD

Recap
=====

TBD

Files used in this Hands-On
===========================

* :download:`application.xml <src/catalogue/application.xml>`
* :download:`expression/run <src/parameters/expression/run.sh>`
* :download:`binning/run.sh <src/multinode/binning/run.sh>`


.. rubric:: Footnotes

.. [#f1] `OpenSearch <http://www.opensearch.org/>`_
