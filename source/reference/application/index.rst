Application descriptor reference
================================

Purpose
-------

The Application descriptor file is an XML document that describes an Application workflow (see :doc:`Application workflow </design/workflow>`) and it contains two blocks:

#. jobTemplates
#. workflow

The **first block** defines the job templates that are then instantiated as workflow nodes of the Directed Acyclic Graph.

Each job template contains:

* the path to the streaming executable
* parameters and optionaly their default value 
* properties (e.g. maximum number of tasks, wall-time, etc.)

The **second block** contains the workflow nodes.

The workflow contains the nodes, each defining:

* the source for the inputs (e.g. a previous node, a catalogue series, a local file or a list of values)  
* their parameter values to override the default parameters (defined in the job template above)

Type
----

The application descriptor is an XML file available in $_CIOP_APPLICATION_PATH/application.xml 

.. note:: the value $_CIOP_APPLICATION_PATH is /application

Format
------

The application descriptor file structure is available below:

+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
| Level	    | Tag name              | Descendants                                               | Tag Contents                  | Cardinality   | Attribute name                | Attribute value        |
+===========+=======================+===========================================================+===============================+===============+===============================+========================+
|>          | application           | All                                                       | -                             | 1..1          | -                             | -                      |
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
|1          | jobTemplates          | jobTemplate                                               | -                             | 1..1          | -                             | -                      |
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
|2          | jobTemplate           | streamingExecutable, defaultParameters, defaultJobconf    | -                             | 1..*          | id                            |job template name       |
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+
|3          | streamingExecutable   | none                                                      | path to streaming executable	| 1..1          | -                             | -                      |
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
|3          | defaultParameters     | parameter                                                 | -                             | 0..1          | -                             | -                      |
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
|4          | parameter             | -                                                         | parameter default value       | 0..*          | id                            |parameter name          |	
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
|3          | defaultJobconf        | -                                                         | -                             | 0..1          | -                             | -                      |		
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
|4          | property              | -                                                         | property value                | 0..*          | id                            | property value         |
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
|1          | workflow              | workflowVersion,node                                      | -                             | 1..1          | id                            | workflow name          |
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
|2          | workflowVersion       | -                                                         | workflow version              | 1..1          | -                             | -                      |
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
|2          | node                  | job, sources, parameters                                  | -                             | 1..*          | id                            | node name	         |
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
|3          | job                   | -                                                         | -                             | 1..1          | id                            |job template name       |
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
|3          | sources               | source                                                    | -                             | 1..1          | -                             | -                      |
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
|4          | source                | -                                                         | source value                  | 1..*          | refid                         |file:urls, wf:node,     |
|           |                       |                                                           |                               |               |                               |cas:series, string:list |
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
|3          | parameters            | parameter                                                 | -                             | 0..*          | -                             | -                      |
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	
|4          | parameter             | -                                                         | parameter value (overrides    | 0..*          | id                            | parameter name         |
|           |                       |                                                           |  the default value)		|               |                               |                        |
+-----------+-----------------------+-----------------------------------------------------------+-------------------------------+---------------+-------------------------------+------------------------+	


.. tip:: Check your application descriptor file with the :doc:`ciop-appcheck </reference/man/bash_commands_functions/miscellaneous/ciop-appcheck>` utility


Application descriptor values and properties
--------------------------------------------

source refid values
^^^^^^^^^^^^^^^^^^^

.. _reference_file:

Reference to a file
~~~~~~~~~~~~~~~~~~~

Define a source as a local ASCII file containing one element per line.

The file can contain any value to be processed: references to products, list of areas of interest, etc.

.. note:: this method sould be used in the early stages of the application development and testing.
	It should be replaced by a comma-separated list of values or a reference to a catalogue.

Local files will use the *file://* protocol and are defined in the workflow as follows:

.. code-block:: xml

	<workflow id="somename">							
		<workflowVersion>1.0</workflowVersion>
			<node id="somenodeid">
				<job id="job_template1"/>
				<sources>
	 				<source refid="file:urls" >/application/input.urls</source>
				</sources>
			</node>
	</workflow>

and the file *input.urls* contains the references to the local files:

.. code-block:: bash

	[ user@sb ~] cat /application/input.urls	
	file:///tmp/somefile1						
	file:///tmp/somefile2						
	file:///tmp/somefile3						

Then the job streaming executable can use :doc:`ciop-copy </reference/man/bash_commands_functions/data/ciop-copy>` to copy the files if needed.

.. code-block:: bash

	while read inputfile
	do
		local_url=`echo $inputfile | ciop-copy -o ./ -`
		# do something with the local_url
		...
	done 

To process areas of interest:
  
.. code-block:: bash

	[ user@sb ~] cat /application/aoi.list
	-10,-10,10,10
	10,10,20,20

In the example above, the executable manages the inputs (areas of interest defined as bounding boxes) with:

.. code-block:: bash

	while read bbox
	do
		echo "processing bounding box $bbox"
		# do something with the bbox value
		...
	done 

.. _reference_csv:

List of comma-separated values
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Passing a list of values to a job follows the same approach as above. 

.. code-block:: xml

	<workflow id="somename">							
		<workflowVersion>1.0</workflowVersion>
			<node id="somenodeid">
				<job id="job_template1"/>
				<sources>
	 				<source refid="string:list" >value1,value2</source>
				</sources>
			</node>
	</workflow>

.. _reference_catalogue:

Products available in a catalogue 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If the products to process are available in a catalogue (either an external catalogue or the sandbox local catalogue), the source is defined as a reference to 
the dataset series URL for its OpenSearch description document.

.. tip:: Check how to copy dataset catalogue entries by reference or by value (the dataset is copied physically to the sandbox storage)
	to the sandbox internal catalogue with the :doc:`ciop-catcp </reference/man/bash_commands_functions/catalogue/ciop-catcp>` utility

To reference an external catalogue, the workflow node is defined as follows:

.. code-block:: xml

	<workflow id="somename">							
		<workflowVersion>1.0</workflowVersion>
			<node id="somenodeid">
				<job id="job_template1"/>
				<sources>
	 				<source refid="cas:series">http://catalogue.terradue.int/catalogue/search/MER_FRS_1P/description</source>
				</sources>
			</node>
	</workflow>

To reference a dataset series in the sandbox internal catalogue

.. code-block:: xml

	<workflow id="somename">							
		<workflowVersion>1.0</workflowVersion>
			<node id="somenodeid">
				<job id="job_template1"/>
				<sources>
	 				<source refid="cas:series">http://localhost/catalogue/sandbox/MER_FRS_1P/description</source>
				</sources>
			</node>
	</workflow>


As an example, the job executable would contain the lines below to copy the catalogue products locally: 

.. code-block:: bash

	while read inputfile
	do
		local_url=`echo $inputfile | ciop-copy -o ./ -`
		# do something with the local_url
		...
	done 

Outputs from a previous node
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The sources defined above are used in the starting node(s) of the workflow.
The subsequent nodes will use the outputs produced by the parent nodes.


.. code-block:: xml

	<workflow id="somename">							
		<workflowVersion>1.0</workflowVersion>
		<node id="some_node_1">
			<job id="some_job_template_1"></job>
			<sources>
				<source refid="file:urls">/application/inputparams</source>
 			</sources>
		</node>
		<node id="some_node_2">
			<job id="some_job_template_2"></job>
			<sources>
				<source refid="wf:node">some_node_1</source>
			</sources>
		</node>
	</workflow>

Job configuration
^^^^^^^^^^^^^^^^^

At job template level, the properties below can be defined:

+---------------------+-----------+----------------------------------------+
|	Property      |   values  | Description                            |												
+=====================+===========+========================================+
| ciop.job.max.tasks  | integer   | sets the maximum number of instances   |
|                     |           | (tasks) to process the inputs          |
+---------------------+-----------+----------------------------------------+												
| mapred.task.timeout | integer   | number of milliseconds of walltime for |
|                     |           | the execution of a job without         |
|                     |           | reporting via ciop-log                 |
+---------------------+-----------+----------------------------------------+

.. note:: Set the property *ciop.job.max.tasks* to 1 if all inputs have to be processed by a single task (e.g. aggregation).
	You don't need to set its value if the node instantiates several tasks, the platform knows how many instances it needs/can instantiate
	
Example
-------

Download the file :download:`Ocean Colour Algal Bloom Detection </field/ocean_color/lib_beam/src/src/main/app-resources/application.xml>` field guide application
to view a complete example of an application descriptor file 

