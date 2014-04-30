Application descriptor reference
================================

Purpose
-------

The application descriptor file contains the definition of the application in terms of:

* job templates including:	
	* streaming executable
* default parameters 
* job default configuration
	* workflow including the workflow nodes defined with
	* the source for the inputs (e.g. a previous node, a catalogue series, a local file)  
	* their parameter values to override the default parameters (defined in the job template above)

Type
----

The application descriptor is an XML file available in $_CIOP_APPLICATION_PATH/application.xml 
	*Note: the value $_CIOP_APPLICATION_PATH is /application*

Format
------

The application descriptor file structure is available below:

+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
| Level	    | Tag name				| Descendants												| Tag Contents					| Cardinality	| Attribute name				| Attribute value	|
+===========+=======================+===========================================================+===============================+===============+===============================+===================+
|>			| application			| All														| -								|1..1			|-								| -					|
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|1			| jobTemplates			| jobTemplate												| -								|1..1			|-								| -					|
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|2			| jobTemplate			| streamingExecutable, defaultParameters, defaultJobconf	|-								|1..*			|id								|job template name	|
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|3			| streamingExecutable	| none														|path to streaming executable	|1..1			|-								|-					|
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|3			| defaultParameters		| parameter													|-								|0..1			|-								|-					|
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|4			| parameter				| -															|parameter default value		|0..*			|id								|parameter name		|	
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|3			| defaultJobconf		| -															|-								|0..1			|-								|-					|		
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|4			| property				| -															|property value					|0..*			|id								|property value		|
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|1			| workflow				| workflowVersion,node										|-								|1..1			|id								|workflow name		|
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|2			| workflowVersion		| -															|workflow version				|1..1			|-								|-					|
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|2			| node					| job, sources, parameters									|-								|1..*			|id								|node name			|
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|3			| job					| -															|-								|1..1			|id								|job template name	|
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|3			| sources				| source													|-								|1..1			|-								|-					|
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|4			| source				| -															|source value					|1..*			|refid							|file:urls, wf:node,|
|			| 						| 															|								|				|								|cas:serie			|
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|3			| parameters			| parameter													|-								|0..*			|-								|-					|
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	
|4			| parameter				| -															|parameter value (overrides	the |0..*			|id								|parameter name		|
|			| 						| 															| parameter default value)		|				|								|					|
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+-------------------+	

**Tip:** *check your application descriptor file with the* **ciop-appcheck** *utility described here: [[ciop-appcheck]]*
TODO

Application descriptor values and properties
--------------------------------------------

source refid values
^^^^^^^^^^^^^^^^^^^

Local inputs
~~~~~~~~~~~~

Local files will use the *file://* protocol and are defined in the workflow as follows:
	| <workflow id="somename">							
	| 	<workflowVersion>1.0</workflowVersion>
	| 	<node id="somenodeid">
	| 		<job id="ceda-collect"></job>
	| 		<sources>
	| 			<source refid="file:urls" >/application/input.urls</source>
	| 		</sources>
	| 	</node>
	| </workflow>

and the file *input.urls* contains the references to the local files:
	| [ user@sb ~] cat /application/input.urls	
	| file:///tmp/somefile1						
	| file:///tmp/somefile2						
	| file:///tmp/somefile3						

Then the job executable can use ciop-copy to copy the files if needed.
	| while read inputfile
	| do
	|	echo $inputfile | ciop-copy -o ./ - 
	| done 

Values
~~~~~~

Passing values to a job follows the same approach as above. 
	| <workflow id="somename">							
	| 	<workflowVersion>1.0</workflowVersion>
	| 	<node id="somenodeid">
	|		<job id="ceda-collect"></job>
	|		<sources>
	|			<source refid="file:urls" >/application/inputparams</source>
	|		</sources>
	| 	</node>
	| </workflow>
  
and the file *inputparams* contains the list of values:
	| [ user@sb ~] cat /application/inputparams
	| -10,-10,10,10
	| 10,10,20,20

In the example above, the executable manages the parameters (bounding boxes) with:

	| while read bbox
	| do
	| 	echo "processing bounding box $bbox"
	| done 

Products available in the sandbox internal catalogue
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

During the sandbox definition and creation you may have selected a list of EO products, the references to these products are available in the sandbox internal catalogue.
The workflow is defined as follows:
	| <workflow id="some_workflow">
	| 	<workflowVersion>1.0</workflowVersion>
	| 	<node id="some_node">						
	| 		<job id="some_job_template"></job>					
	| 		<sources>
	| 			<source refid="cas:serie">ATS_TOA_1P</source>
	| 		</sources>
	| 		<parameters>							
	| 			<parameter id="some_parameter">some_value</parameter>
	| 		</parameters>
	| 	</node>

As an example, the job executable would contain the lines below to copy the catalogue products locally: 
	| while read product
	| do
	| 		echo $product | ciop-copy -o ./ -
	| done

outputs from a previous node
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The methods above are used for the first job of the workflow. The remaining nodes need to refer the precedent job(s) results:
	| <workflow id="somename">							
	| 	<workflowVersion>1.0</workflowVersion>
	| 	<node id="some_node_1">
	| 		<job id="some_job_template_1"></job>
	| 		<sources>
	| 			<source refid="file:urls">/application/inputparams</source>
	| 		</sources>
	| 	</node>
	| 	<node id="some_node_2">
	| 		<job id="some_job_template_2"></job>
	| 		<sources>
	| 			<source refid="wf:node">some_node_1</source>
	| 		</sources>
	| 	</node>
	| </workflow>

Job configuration
^^^^^^^^^^^^^^^^^

At job template level, the default properties below can be defined:

+---------------------+-----------+----------------------------------------+
|	Property		  |   values  |		Description			   		   	   |												
+=====================+===========+========================================+
| ciop.job.max.tasks  | integer   | sets the maximum number of jobs (>0)   |
+---------------------+-----------+----------------------------------------+												
| mapred.task.timeout | integer   | number of milliseconds of walltime for |
|					  |			  | the execution of a job without 		   |
|					  |			  | reporting via ciop-log				   |
+---------------------+-----------+----------------------------------------+

Example
-------

The example below is taken from the BEAM Arithm tutorial available here: [[Beam Arithm]] TODO

	| <?xml version="1.0" encoding="UTF-8"?>
	| <application id="beam_arithm">
	| 	<jobTemplates>
	| 		<!-- BEAM BandMaths operator job template  -->
	| 		<jobTemplate id="expression">
	| 			<streamingExecutable>/application/expression/run</streamingExecutable>
	| 			<defaultParameters>						
	| 				<parameter id="expression">l1_flags.INVALID?0:radiance_13>15?0:100+radiance_9-(radiance_8+(radiance_10-radiance_8)*27.524/72.570)</parameter>
	| 			</defaultParameters>
	| 		</jobTemplate>
	| 		<!-- BEAM Level 3 processor job template  -->
	| 		<jobTemplate id="binning">
	| 			<streamingExecutable>/application/binning/run</streamingExecutable>
	| 			<defaultParameters>						
	| 				<parameter id="cellsize">9.28</parameter>
	| 				<parameter id="bandname">out</parameter>
	| 				<parameter id="bitmask">l1_flags.INVALID?0:radiance_13>15?0:100+radiance_9-(radiance_8+(radiance_10-radiance_8)*27.524/72.570)</parameter>
	| 				<parameter id="bbox">-180,-90,180,90</parameter>
	| 				<parameter id="algorithm">Minimum/Maximum</parameter>
	| 				<parameter id="outputname">binned</parameter>
	| 				<parameter id="resampling">binning</parameter>
	| 				<parameter id="palette">#MCI_Palette
	| color0=0,0,0
	| color1=0,0,154
	| color2=54,99,250
	| color3=110,201,136
	| color4=166,245,8
	| color5=222,224,0
	| color6=234,136,0
	| color7=245,47,0
	| color8=255,255,255
	| numPoints=9
	| sample0=98.19878118960284
	| sample1=98.64947122314665
	| sample2=99.10016125669047
	| sample3=99.5508512902343
	| sample4=100.0015413237781
	| sample5=100.4522313573219
	| sample6=100.90292139086574
	| sample7=101.35361142440956
	| sample8=101.80430145795337</parameter>
	| 				<parameter id="band">1</parameter>
	| 				<parameter id="tailor">true</parameter>
	| 			</defaultParameters>
	| 			<defaultJobconf>
	| 		        	<property id="ciop.job.max.tasks">1</property>
	| 		        </defaultJobconf>
	| 		</jobTemplate>
	| 	</jobTemplates>
	| 	<workflow id="beam_arithm">							
	| 		<workflowVersion>1.0</workflowVersion>
	| 		<node id="node_expression">				
	| 			<job id="expression"></job>			
	| 			<sources>
	| 				<!-- <source refid="file:urls">/home/fbrito/meris</source>  -->
	| 				<source refid="cas:serie">MER_RR__1P</source>
	| 			</sources>
	| 			<parameters>					
	| 			</parameters>
	| 		</node>
	| 		<node id="node_binning">				
	| 			<job id="binning"></job>			
	| 			<sources>
	| 				<source refid="wf:node">node_expression</source>				
	| 			</sources>
	| 			<parameters>
	| 				<parameter id="bitmask"/>		
	| 			</parameters>
	| 		</node>
	| 	</workflow>
	| </application>


Properties
----------

.. _mapred.task.timeout:

mapred.task.timeout
^^^^^^^^^^^^^^^^^^^

.. _ciop.job.max.tasks:

ciop.job.max.tasks
^^^^^^^^^^^^^^^^^^
