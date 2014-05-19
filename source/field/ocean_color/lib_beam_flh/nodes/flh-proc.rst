Node flh-proc
=============

The flh-proc job template defines the streaming executable and the wall time

The job template includes the path to the streaming executable.

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 26
  
The streaming executable source is available here: `/application/binning/run <https://github.com/Terradue/BEAM-Arithm-tutorial/blob/master/binning/run>`_
  
The job template defines three parameters:

+----------------+-----------------+------------------------------------------------------------+
| Parameter name | Default value   | Description                                                | 
+================+=================+============================================================+
| cellsize       | 9.28            | Size of the bin for the Binning algorithm [#f1]_           |
+----------------+-----------------+------------------------------------------------------------+
| bbox           | -180,-90,180,90 | Bounding box of the area of interest (Xmin,Ymin,Xmax,Ymax) |
+----------------+-----------------+------------------------------------------------------------+
| algorithm      | Minimum/Maximum | Aggregation methog for the Binning algorithm               |
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
  
.. rubric:: Footnotes

.. [#f1] `ESA BEAM Toolbox Binning algorithm <http://www.brockmann-consult.de/beam/doc/help/binning/BinningTool.html>`_
