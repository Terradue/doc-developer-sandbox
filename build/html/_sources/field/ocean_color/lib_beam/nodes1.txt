Processing nodes design
=======================

Preparing the templates
***********************

Now that the test data is available and the software required to build the application is installed, you will now define the job templates.

The job templates are XML blocks of the application descriptor file which, by default, is found in /application/application.xml

Each job template XML block contains:
* a streaming executable: this file is a Linux executable able to process the inputs passed via stdin
* a set of one or more parameters, each with a type, target, an id and optionally a default value
* the job default configuration defining, for example, the execution wall time and the maximum number of concurrent tasks

The BandMaths Operator
----------------------

As the first job in this workflow, the expression processing step:
* defines the parameters to query the catalogue which, in this case is the start and end time (time of interest) of the MERIS Level 1 products.
* invokes the ESA BEAM Toolbox BandMaths Operator to apply the provided band arithmetic expression to all products covering the time of interest 
* publishes the results in a distributed file system

<pre>
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
</pre>

The job template is called "expression" and it defines three parameters:
* expression with a default defined 
* startdate of type opensearch and a target time:start
* enddate of type opensearch and a target time:end

While the first defines the default value of the BandMaths Operator arithmetic expression to be applied to the MERIS Level 1 data, the other two (of type opensearch) are used to query the OpenSearch catalogue of the sandbox.
Each OpenSearch catalogue defines a query template via its description file accessible at http://<sandbox IP>/catalogue/sandbox/MER_RR__1P/description

Here's a subset of this description document

<pre>
template="http://10.16.10.70/catalogue/sandbox/MER_RR__1P/rdf/?count={count?}&amp;name={geo:name?}&amp;startPage={startPage?}&amp;startIndex={startIndex?}&amp;q={searchTerms?}&amp;start={time:start?}&amp;stop={time:end?}&amp;bbox={geo:box?}&amp;geometry={geo:geometry?}&amp;uid={geo:uid?}"
</pre>

Among other parameters such as the bounding box, the OpenSearch description document template defines start={time:start?} and stop={time:end?}.
The framework will thus map the expression job template parameters startdate and enddate to the right catalogue queryables using the type:
* stardate of target time:start will be mapped to the template queryable start={time:start?}
* stopdate of target time:end will be mapped to the template queryable stop={time:end?}

So the resulting query to the catalogue for te job expression will be:

http://<sandbox IP>/catalogue/sandbox/MER_RR__1P/rdf?start=<value of parameter startdate>&stop=<value of parameter stopdate>

What if you want to search the catalogue for MERIS products over a given and default bounding box? You would do:

<pre>
<jobTemplate id="expression">
      <streamingExecutable>/application/expression/run</streamingExecutable>
      <defaultParameters>
	<parameter id="expression">l1_flags.INVALID?0:radiance_13>17?0:100+radiance_9-(radiance_8+(radiance_10-radiance_8)*27.524/72.570)</parameter>
      	<parameter type="opensearch" target="time:start" id="startdate"/>
      	<parameter type="opensearch" target="time:end" id="enddate"/>
      	<parameter type="opensearch" target="geo:box" id="aoi">-10,-10,20,20</parameter>
	</defaultParameters>
	<defaultJobconf>
	<property id="mapred.task.timeout">9900000000000</property>
	</defaultJobconf>
  </jobTemplate>
</pre>

In this case, the resulting query would be:

http://<sandbox IP>/catalogue/sandbox/MER_RR__1P/rdf?start=<value of parameter startdate>&stop=<value of parameter stopdate>&bbox=-10,-10,20,20

In the defaultJobconf section, the expression job template defines the task timeout in miliseconds which is the maximum time allowed from the last ciop-log invocation before the process is killed. 

Arranging the BandMaths Operator results
----------------------------------------

The application goal is to produce daily binned products so the binning processing step needs to have its inputs well organized so that it aggregates in time and space only the products of a given day.
In terms of job template, you will define the path to the streaming executable, one parameter: the period (a day) and instruct the framework that only one task has to be run.

<pre>
  <jobTemplate id="arrange">
    <streamingExecutable>/application/arrange/run.R</streamingExecutable>
      <defaultParameters>
        <parameter id="period">day</parameter>
      </defaultParameters>
      <defaultJobconf>
        <property id="ciop.job.max.tasks">1</property>
      </defaultJobconf>
  </jobTemplate> 
</pre>

The Level 3 Binning Processor
-----------------------------

The binning job template defines the streaming executable, the wall time and the parameters:
* cellsize which is the size of the bin and it is specified in kilometers (more info about the binning algorithm http://www.brockmann-consult.de/beam/doc/help/index.html)
* bbox that defines the area of interest. Its values defaults to -180,-90,180,90.
* algorithm defaulting to Minimum/Maximum (in this applications, we want the maximum value). The other possible values are: "Maximum Likelihood" and "Arithmetic Mean"

<pre>
  <jobTemplate id="binning">
    <streamingExecutable>/application/binning/run</streamingExecutable>
	<defaultParameters>						
	  <parameter id="cellsize">9.28</parameter>
	  <parameter id="bbox">-180,-90,180,90</parameter>
	  <parameter id="algorithm">Minimum/Maximum</parameter>
	</defaultParameters>
	<defaultJobconf>
      <property id="mapred.task.timeout">9900000000000</property>
    </defaultJobconf>
  </jobTemplate> 
</pre>

The clustering step
-------------------

The R DBSCAN algorithm implementation allows defining several parameters, the job template is created with:
- eps which is the reachability distance defaulting to 10
- minpts, the rreachability minimum no. of points defaulting to 10
Other parameters could be included if you want to experiment the clustering algorithm fine tuning (not the goal of this tutorial).

Algal blooms correspond to high values of MCI, so the template allows defining a threshold defaulting to 100.5 so the DBSCAN clustering will run against thos pixels with the MCI value above the threshold value.

<pre>
  <jobTemplate id="clustering">
    <streamingExecutable>/application/clustering/run.R</streamingExecutable>
    <defaultParameters>
	  <parameter id="eps">10</parameter>
	  <parameter id="minpts">10</parameter>
      <parameter id="threshold">100.5</parameter>
    </defaultParameters>
    <defaultJobconf>
      <property id="ciop.job.max.tasks">1</property>
    </defaultJobconf>
  </jobTemplate>
</pre>
