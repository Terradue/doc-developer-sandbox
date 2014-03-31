Node binning
============

The binning job template defines the streaming executable, the wall time and the parameters:

* cellsize which is the size of the bin and it is specified in kilometers (more info about the binning algorithm http://www.brockmann-consult.de/beam/doc/help/index.html)
* bbox that defines the area of interest. Its value defaults to -180,-90,180,90.
* algorithm defaulting to Minimum/Maximum (in this application, we want the maximum value). The other possible values are: "Maximum Likelihood" and "Arithmetic Mean"

The job template includes the path to the streaming executable.

.. literalinclude:: ../src/application.xml
  :language: xml
  :lines: 26
  
The streaming executable source is available here: `/application/binning/run <https://github.com/Terradue/BEAM-Arithm-tutorial/blob/master/binning/run>`_
  
The job template defines three parameters:

+----------------+--------------------------------------------------------------------------------------------------------+-------------------------------------------------+
| Parameter name | Default value                                                                                          | Description                                     |                                                                                                                      |
+================+========================================================================================================+=================================================+
| expression     | l1_flags.INVALID?0:radiance_13>17?0:100+radiance_9-(radiance_8+(radiance_10-radiance_8)*27.524/72.570) | Band arithmetic expression for ESA BEAM Toolbox |
+----------------+--------------------------------------------------------------------------------------------------------+-------------------------------------------------+
| startdate      | startdate of type opensearch and a target time:start                                                   |                                                 |
+----------------+--------------------------------------------------------------------------------------------------------+-------------------------------------------------+
| enddate        | enddate of type opensearch and a target time:end                                                       |                                                 |
+----------------+--------------------------------------------------------------------------------------------------------+-------------------------------------------------+

which translates to:

.. literalinclude:: ../src/application.xml
  :language: xml
  :lines: 27-32

The job template set the property mapred.task.timeout, the wall time between messages in the log:

.. literalinclude:: ../src/application.xml
  :language: xml
  :lines: 33-35

Here's the job template including the elements described above.

.. literalinclude:: ../src/application.xml
  :language: xml
  :lines: 25-36
