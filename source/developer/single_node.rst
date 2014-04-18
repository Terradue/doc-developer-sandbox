.. _single_node:

Hands-On Exercise: a single node workflow
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
 
* Create a file named *application.xml*:

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

In the *application.xml* we defined a workflow with a single node and the related streaming executable:

.. literalinclude:: src/application-sn.xml
  :language: xml
  :tab-width: 2
  :lines: 5-5

Actually the streaming executable *executes* your application in a node of a cluster. So, we have to create this file:

* Go to the application default path and create the executable directory:

.. code-block:: bash

 $ cd /application
 $ mkdir expression
 $ cd expression
 
* Create a file named *run*:

.. code-block:: bash

 $ touch run
 
* Open it with a text editor (e.g. vi) and paste the following code in the file just created:

.. literalinclude:: src/expression.sh
  :language: bash
  :tab-width: 2

Run the workflow
^^^^^^^^^^^^^^^^


.. rubric:: Footnotes

.. [#f1] `Directed acyclic graph <http://en.wikipedia.org/wiki/Directed_acyclic_graph>`_
