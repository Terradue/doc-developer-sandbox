Node expression
===============

As the first job in this workflow, the expression processing step implements a streaming executable:

* Defines the parameters to query the catalogue which, in this case is the start and end time (time of interest) of the MERIS Level 1 products.
* Stages-in the input Envisat MERIS Level 1 products
* Invokes the ESA BEAM Toolbox BandMaths Operator to apply the provided band arithmetic expression to all input MERIS Level 1 products covering the time of interest 
* Stages-out the results in a distributed file system as inputs to the next processing step

The job template includes the path to the streaming executable.

.. code-block:: xml

  <streamingExecutable>/application/expression/run</streamingExecutable>
  
The streaming executable source is available here: `/application/expression/run <https://github.com/Terradue/BEAM-Arithm-tutorial/blob/master/expression/run>`_
  
The job template defines three parameters:

* expression with a default value defined 
* startdate of type opensearch and a target time:start
* enddate of type opensearch and a target time:end

.. code-block:: xml

  <defaultParameters>
    <parameter id="expression">l1_flags.INVALID?0:radiance_13>17?0:100+radiance_9-(radiance_8+(radiance_10-radiance_8)*27.524/72.570)</parameter>
    <parameter type="opensearch" target="time:start" id="startdate"/>
    <parameter type="opensearch" target="time:end" id="enddate"/>
  </defaultParameters>

The job template set the property mapred.task.timeout, the wall time between messages in the log:

.. literalinclude:: ../src/application.xml
  :language: xml
  :lines: 12-14

.. code-block:: xml

  <defaultJobconf>
  	<property id="mapred.task.timeout">9900000000000</property>
  </defaultJobconf>
  	
Here's the job template including the elements described above.

.. code-block:: xml

  <jobTemplate id="expression">
    <streamingExecutable>/application/expression/run</streamingExecutable>
    <defaultParameters>
  	  <parameter id="expression">l1_flags.INVALID?0:radiance_13>17?0:100+radiance_9-(radiance_8+(radiance_10-radiance_8)*27.524/72.570)</parameter>
      <parameter type="opensearch" target="time:start" id="startdate"/>
      <parameter type="opensearch" target="time:end" id="enddate"/>
  	</defaultParameters>
  	<defaultJobconf>
      <property id="mapred.task.timeout">9900000000000</property>
  	</defaultJobconf>
  </jobTemplate>
  
.. literalinclude:: ../src/application.xml
  :language: xml
  :lines: 4-15
