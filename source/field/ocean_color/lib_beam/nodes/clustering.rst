Node clustering
===============

The R DBSCAN algorithm implementation [#f1]_ allows defining several parameters, the job template is created with:
* eps which is the reachability distance defaulting to 10
* minpts, the reachability minimum no. of points defaulting to 10

Algal blooms correspond to high values of MCI, so the template allows defining a threshold defaulting to 100.5 so the DBSCAN clustering will run against thos pixels with the MCI value above the threshold value.

Other DBSCAN parameters could be included to experiment the clustering algorithm fine tuning (not the goal of this experiment).

The job template includes the path to the streaming executable.

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 37

The streaming executable source is available here: `/application/clustering/run.R <https://github.com/Terradue/BEAM-Arithm-tutorial/blob/master/clustering/run.R>`_


The job template defines a single parameter:

+----------------+----------------+-------------------------------------------------------+
| Parameter name | Default value | Description                                            |
+================+===============+========================================================+
| eps            | 10            | reachability distance                                  |
+----------------+---------------+--------------------------------------------------------+
| minpts         | 10            | reachability minimum no. of points                     |
+----------------+---------------+--------------------------------------------------------+ 
| threshold      | 100.5         | threshold to declare a pixel belongs to an algal bloom |
+----------------+---------------+--------------------------------------------------------+

which translates to the XML code in the node clustering job template: 

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 38-42

The job template sets the :ref:`ciop.job.max.tasks` to one instance to instantiate one insatnce of the streaming executable

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 43-45
  	
.. NOTE::
  The property :ref:`mapred.task.timeout` is not set and uses the default value (10 minutes).*

Here's the job template including all the elements described above:

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 36-46 

.. rubric:: Footnotes

.. [#f1] R DBSCAN algorithm `documentation <http://cran.r-project.org/web/packages/fpc/fpc.pdf>`_
