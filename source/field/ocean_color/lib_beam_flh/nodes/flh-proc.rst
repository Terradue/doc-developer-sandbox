Node flh-proc
=============

The flh-proc job template defines the streaming executable and the wall time.

The job template includes the path to the streaming executable.

.. literalinclude:: ../src/src/main/app-resources/application.xml
  :language: xml
  :tab-width: 1
  :lines: 6
  
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

.. literalinclude:: ../src/src/main/app-resources/application.xml
  :language: xml
  :tab-width: 1
  :lines: 7-13

The job template set the property mapred.task.timeout, the wall time between messages in the log:

.. literalinclude:: ../src/src/main/app-resources/application.xml
  :language: xml
  :tab-width: 1
  :lines: 14-16

Here's the job template including the elements described above:

.. literalinclude:: ../src/src/main/app-resources/application.xml
  :language: xml
  :tab-width: 1
  :lines: 4-18


The streaming executable implements the activities:

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

The streaming executable source is available here: `/application/flh-proc/run.sh <../src/src/main/app-resources/flh-proc/run.sh>`_ 
