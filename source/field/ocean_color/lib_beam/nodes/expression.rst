Node expression
===============

As the first job in this workflow, the expression processing step implements a streaming executable:

* Defines the parameters to query the catalogue which, in this case is the start and end time (time of interest) of the MERIS Level 1 products.
* Stages-in the input Envisat MERIS Level 1 products [#f1]_
* Invokes the ESA BEAM Toolbox BandMaths Operator [#f2]_ to apply the provided band arithmetic expression to all input MERIS Level 1 products covering the time of interest 
* Stages-out the results in a distributed file system as inputs to the next processing step

The job template includes the path to the streaming executable.

.. literalinclude:: ../src/application.xml
  :language: xml
  :lines: 5
  
The streaming executable source is available here: `/application/expression/run <https://github.com/Terradue/BEAM-Arithm-tutorial/blob/master/expression/run>`_
  
The job template defines three parameters:

+----------------+---------------------------------------------------------------------------------------------------------------+-------------------------------------------------+
| Parameter name | Default value                                                                                                 | Description                                     |
+================+===============================================================================================================+=================================================+
| expression     | l1_flags.INVALID?0:radiance_13>17?0:100+radiance_9-(radiance_8+(radiance_10-radiance_8)*27.524/72.570)        | Band arithmetic expression for ESA BEAM Toolbox |
+----------------+---------------------------------------------------------------------------------------------------------------+-------------------------------------------------+
| startdate      | startdate of type opensearch and a target time:start                                                          |                                                 |
+----------------+---------------------------------------------------------------------------------------------------------------+-------------------------------------------------+
| enddate        | enddate of type opensearch and a target time:end                                                              |                                                 |
+----------------+---------------------------------------------------------------------------------------------------------------+-------------------------------------------------+

which translates to:

.. literalinclude:: ../src/application.xml
  :language: xml
  :lines: 6-11

The job template set the property mapred.task.timeout, the wall time between messages in the log:

.. literalinclude:: ../src/application.xml
  :language: xml
  :lines: 12-14

Here's the job template including the elements described above:

.. literalinclude:: ../src/application.xml
  :language: xml
  :lines: 4-15

.. rubric:: Footnotes

.. [#f1] `Envisat MERIS  <https://earth.esa.int/web/guest/missions/esa-operational-eo-missions/envisat/instruments/meris>`_
.. [#f2] `ESA BEAM Toolbox BandMaths <http://www.brockmann-consult.de/beam/doc/help/gpf/org_esa_beam_gpf_operators_standard_BandMathsOp.html>`_ 
