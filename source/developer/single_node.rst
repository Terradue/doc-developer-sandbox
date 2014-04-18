.. _single_node:

Hands-on exercise: a single node workflow
##########################################

Install the BEAM Toolbox
^^^^^^^^^^^^^^^^^^^^^^^^

BEAM is an open-source toolbox and development platform for viewing, analyzing and processing of remote sensing raster data. We will use it in our Hand-ons exercises. To install it simply type:

.. code-block:: bash

 sudo yum install esa-beam-4.11


Prepare a workflow
^^^^^^^^^^^^^^^^^^

A workflow is a DAG [#f1]_. There is a special file, named *application.xml*, that defines a workflow. The first step is to create an *application.xml*:

* Go to the application default path:

.. code-block:: bash

 $ cd /application
 
* Create a file named application.xml:

.. code-block:: bash

 $ touch application.xml
 
* Give to your user/group the read/write permissions:

.. code-block:: bash

 $ chmod 664 application.xml
 
* Open it with a text editor (e.g. vi) and paste the following code in the file just created:

.. literalinclude:: src/application-sn.xml
  :language: xml
  :tab-width: 2


Prepare the streaming executable
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


Run a test workflow
^^^^^^^^^^^^^^^^^^^


.. rubric:: Footnotes

.. [#f1] `Directed acyclic graph <http://en.wikipedia.org/wiki/Directed_acyclic_graph>`_
