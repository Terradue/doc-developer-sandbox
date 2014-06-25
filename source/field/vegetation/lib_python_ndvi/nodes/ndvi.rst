Node ndvi
=========

This is the first node of the workflow. As such, the platform takes cares of providing the inputs to the streaming executable: the list of Landsat catalogue entries you created earlier. 

.. tip:: ciop-copy can handle catalogue entries and download the datasets using the online resources in the metadata

A node requires a job template. The job template includes the path to the streaming executable:

.. code-block:: XML

  <jobTemplates>
      <jobTemplate id="py-ndvi">
        <streamingExecutable>/application/py-ndvi/run.py</streamingExecutable>
        <defaultParameters>
    </defaultParameters>
        <defaultJobconf>
          <property id="mapred.task.timeout">9900000000000</property>
        </defaultJobconf>
      </jobTemplate>
    </jobTemplates>

.. admonition:: Remember the code for this application is available here: https://github.com/Terradue/dcs-python-ndvi


The job template defines three parameters:

+----------------+---------------------------------------------------------------------------------------------------------------+------------------------------------------------------+
| Parameter name | Default value                                                                                                 | Description                                          |
+================+===============================================================================================================+======================================================+
| expression     | l1_flags.INVALID?0:radiance_13>17?0:100+radiance_9-(radiance_8+(radiance_10-radiance_8)*27.524/72.570)        | Band arithmetic expression for ESA BEAM Toolbox      |
+----------------+---------------------------------------------------------------------------------------------------------------+------------------------------------------------------+
| startdate      | 2012-04-02                                                                                                    | startdate of type opensearch and a target time:start |
+----------------+---------------------------------------------------------------------------------------------------------------+------------------------------------------------------+
| enddate        | 2012-04-06                                                                                                    | enddate of type opensearch and a target time:end     |
+----------------+---------------------------------------------------------------------------------------------------------------+------------------------------------------------------+

which translates to:

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 6-11

The job template set the property mapred.task.timeout, the wall time between messages in the log:

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 12-14

Here's the job template including the elements described above:

.. literalinclude:: ../src/application.xml
  :language: xml
  :tab-width: 1
  :lines: 4-15

.. rubric:: Footnotes

.. [#f1] `Envisat MERIS  <https://earth.esa.int/web/guest/missions/esa-operational-eo-missions/envisat/instruments/meris>`_
.. [#f2] `ESA BEAM Toolbox BandMaths <http://www.brockmann-consult.de/beam/doc/help/gpf/org_esa_beam_gpf_operators_standard_BandMathsOp.html>`_ 
