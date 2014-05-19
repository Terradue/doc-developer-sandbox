Node flh-proc
=============

The flh-proc job template defines the streaming executable and the wall time.

The job template includes the path to the streaming executable.

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 26
  
The job template defines three parameters:

+----------------+-----------------+------------------------------------------------------------+
| Parameter name | Default value   | Description                                                | 
+================+=================+============================================================+
| startdate      | N/A             | Start date of time of Interest                             |
+----------------+-----------------+------------------------------------------------------------+
| enddate        | N/A             | End date of time of Interest                               |
+----------------+-----------------+------------------------------------------------------------+
| format         | GeoTIFF         | Format of the output FLH product (GeoTIFF or BEAM-DIMAP)   |
+----------------+-----------------+------------------------------------------------------------+

which translates to:

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 27-31

The job template set the property mapred.task.timeout, the wall time between messages in the log:

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 32-34

Here's the job template including the elements described above:

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 25-35


The streaming executable source is available here: `/application/binning/run <https://github.com/Terradue/BEAM-Arithm-tutorial/blob/master/binning/run>`_ and implements the activities:

.. uml::

  !define DIAG_NAME Workflow example

  !include includes/skins.iuml

  skinparam backgroundColor #FFFFFF
  skinparam componentStyle uml2

  start

  :Source libraries;
  
  :Get format parameter value;
  
  :Check format parameter value;
  
  while (check stdin?) is (line)
    :Stage-in MERIS Level 1b product;
    :Apply FLH operator to MERIS Level 1b product with format defined;
    :Stage-out FLH product;
  endwhile (empty)
  
  stop

.. rubric:: Footnotes

.. [#f1] `ESA BEAM Toolbox Binning algorithm <http://www.brockmann-consult.de/beam/doc/help/binning/BinningTool.html>`_
