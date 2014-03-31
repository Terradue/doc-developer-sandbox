Node arrange
===============

This section defines the node *arrange* job template. The template is part of the application descriptor file [#f1]_.

The application goal is to produce daily binned products so the binning processing step needs to have its inputs well organized so that it aggregates in time and space only the products of a given day. 

In terms of job template, you will define the path to the streaming executable, one parameter: the period (a day) and instruct the framework that only one task has to be run.

As the second job in this workflow, the expression processing step implements a streaming executable that:

* Create an R data frame [#f2]_ with all references to the data produced by the node expression
* Split the references by period based in the acquisition start time of the input product into groups of references
* Write the groups to the local filesystem in Tab separated files
* Stage-out the Tab separated files to the distributed file system

The job template includes the path to the streaming executable.

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 17
  
The streaming executable source is available here: `/application/arrange/run.R <https://github.com/Terradue/BEAM-Arithm-tutorial/blob/master/arrange/run.R>`_
  
The job template defines a single parameter:

+----------------+----------------+-------------------------------------------------+
| Parameter name | Default value  | Description                                     |
+================+================+=================================================+
| period         | day            | The period for the temporal aggregation (daily) |
+----------------+----------------+-------------------------------------------------+

* The period for the temporal aggregation (daily)

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 18-20

The job template sets the :ref:`ciop.job.max.tasks` to one instance since the streaming executable has to process all inputs at once 

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 21-23
  	
.. NOTE::
  The property :ref:`mapred.task.timeout` is not set and uses the default value (10 minutes).*

Here's the job template including the elements described above.

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 16-24 

.. rubric:: Footnotes

.. [#f1] The application file descriptor reference is found :doc:`here </reference/application>` and the entire Algal Bloom detection application descriptor file here: `/application/application.xml  <https://github.com/Terradue/BEAM-Arithm-tutorial/blob/master/application.xml>`_  
.. [#f2] `R data frames <http://stat.ethz.ch/R-manual/R-devel/library/base/html/data.frame.html>`_ 
