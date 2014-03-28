Node expression
===============

As the first job in this workflow, the expression processing step implements a streaming executable:

* defines the parameters to query the catalogue which, in this case is the start and end time (time of interest) of the MERIS Level 1 products.
* stages-in the input Envisat MERIS Level 1 products
* invokes the ESA BEAM Toolbox BandMaths Operator to apply the provided band arithmetic expression to all input MERIS Level 1 products covering the time of interest 
* publishes the results in a distributed file system as inputs to the next processing step

The job template includes the path to the streaming executable.

The job template is called "expression" and it defines three parameters:

* expression with a default value defined 
* startdate of type opensearch and a target time:start
* enddate of type opensearch and a target time:end

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

While the first defines the default value of the BandMaths Operator arithmetic expression to be applied to the MERIS Level 1 data, the other two (of type opensearch) are used to query the OpenSearch catalogue of the sandbox.
Each OpenSearch catalogue defines a query template via its description file accessible at http://<sandbox IP>/catalogue/sandbox/MER_RR__1P/description

Here's a subset of this description document

.. code-block:: bash

  template="http://10.16.10.70/catalogue/sandbox/MER_RR__1P/rdf/?count={count?}&amp;name={geo:name?}&amp;startPage={startPage?}&amp;startIndex={startIndex?}&amp;q={searchTerms?}&amp;start={time:start?}&amp;stop={time:end?}&amp;bbox={geo:box?}&amp;geometry={geo:geometry?}&amp;uid={geo:uid?}"

Among other parameters such as the bounding box, the OpenSearch description document template defines start={time:start?} and stop={time:end?}.

The framework will thus map the expression job template parameters startdate and enddate to the right catalogue queryables using the type:

* stardate of target time:start will be mapped to the template queryable start={time:start?}
* stopdate of target time:end will be mapped to the template queryable stop={time:end?}

So the resulting query to the catalogue for the job expression will be:

http://<sandbox IP>/catalogue/sandbox/MER_RR__1P/rdf?start=<value of parameter startdate>&stop=<value of parameter stopdate>
