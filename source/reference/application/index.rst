Application descriptor reference
================================

Purpose
-------

The Application descriptor file is an XML document that describes an Application workflow (see :doc:`Application workflow </design/workflow>`). With it you can define in a structured way, the steps needed by your application to:

* provide a service interface (based on the OGC WPS standard);
* discover and download input data;
* process data, producing intermediate and final results;
* trigger remote web processing services;
* publish result files.

Descriptor type
---------------

The application descriptor is an XML file available in $_CIOP_APPLICATION_PATH/application.xml 

.. note:: the value $_CIOP_APPLICATION_PATH is /application

Descriptor structure
--------------------

The application descriptor structure consists of two separate sections:

#. jobTemplates
#. workflow

The **first part** defines the job templates that are then instantiated as workflow steps of the Directed Acyclic Graph.

Each job template contains:

* the path to the streaming executable
* parameters and optionally their allowed and default values
* properties (e.g. maximum number of tasks, processing timeout, etc.)

The **second part** contains the workflow steps, here called "nodes".

Each node can contain:

* the source for the inputs (e.g. a previous node, a catalogue series, a local file or a list of values)  
* their parameter values to override the default parameters (defined in the job template above)

Job Templates
-------------

Parent definition
^^^^^^^^^^^^^^^^^

Tag definition
~~~~~~~~~~~~~~

.. code-block:: xml
	
    <jobTemplates>
    	<jobTemplate></jobTemplate>
    </jobTemplates>

|
 
Attributes
~~~~~~~~~~   
+----------+----------------------------------+-----------+
| Name     | Data type and values             | Mandatory |
+==========+==================================+===========+
| id       | Character String type, not empty | Yes       |
+----------+----------------------------------+-----------+
| jobType  | jobType data structure, Table 2  | No        |
+----------+----------------------------------+-----------+

**Table 1: Job Templates attributes.**

|

+-----------------+--------------------------------------------------------------------------------------------------------------------------+
| Value           | Definition                                                                                                               |
+=================+==========================================================================================================================+
| mapred_action   | Default job Template type. This type will be used as default if no type is defined.                                      |
+-----------------+--------------------------------------------------------------------------------------------------------------------------+
| wps_client      | A job Type which is a connector for external OGC WPS servers. A set of default job configuration is needed (see Table 8).|
+-----------------+--------------------------------------------------------------------------------------------------------------------------+

**Table 2: jobType data structure.**

|

Streaming Executable
^^^^^^^^^^^^^^^^^^^^

Description
~~~~~~~~~~~~

The local path of the executable script called by this job to process the inputs. In the case of jobType="wps_client" it must be omitted.
Supported languages:

* Bash
* Python
* R


Tag definition
~~~~~~~~~~~~~~

.. code-block:: xml
	
	<jobTemplate>
	    <streamingExecutable></streamingExecutable>
	</jobTemplate>

|	
	
Attributes
~~~~~~~~~~

None

Example
~~~~~~~

.. code-block:: xml

    <streamingExecutable>/application/mynode/run.sh</streamingExecutable>


Default Parameters
^^^^^^^^^^^^^^^^^^

Description
~~~~~~~~~~~~

The default parameters for the job. You can override their attributes and values by using the parameters section of the workflow.

Tag definition
~~~~~~~~~~~~~~

.. code-block:: xml

	<jobTemplate>
		<defaultParameters>
			<parameter></parameter>
		</defaultParameters>	
	</jobTemplate>

|

Attributes (for the single parameter)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+-----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+----------------------+
| Name      | Data type and values                                                                                                                          | Mandatory | If "scope = runtime" |
+===========+===============================================================================================================================================+===========+======================+
| id        | Character String type, not empty                                                                                                              | Yes       | Yes                  |
+-----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+----------------------+
| title     | Character String type, not empty                                                                                                              | No        | Yes                  |
+-----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+----------------------+
| abstract  | Character String type, not empty                                                                                                              | No        | Yes                  |
+-----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+----------------------+
| scope     | Scope data structure, Table 4                                                                                                                 | No        | -                    |
+-----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+----------------------+
| type      | Type data structure, Table 5                                                                                                                  | No        | No                   |
+-----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+----------------------+
| dataType  | Type data structure. By default is "string" if not defined (see https://www.w3.org/TR/xmlschema-2/#built-in-datatypes for possible data types)| No        | No                   |
+-----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+----------------------+
| metadata  | Regular expression, it must be satisfied by the parameter value. Optional, only for literalData type                                          | No        | No                   |
+-----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+----------------------+
| target    | Query parameter from the description of the source catalogue (mandatory in case of type="opensearch")                                         | No        | No                   |
+-----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+----------------------+
| minOccurs | Minimum number of expected instances of the parameter (WPS). By default is 1 (meaning that it's mandatory)                                    | No        | No                   |
+-----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+----------------------+
| maxOccurs | Maximum number of expected instances of the parameter (WPS). By default is 100                                                                | No        | No                   |
+-----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+----------------------+

**Table 3: Default Parameters attributes.**

|

+----------+----------------------------------------------------------+
| Value    | Definition                                               |
+==========+==========================================================+
| runtime  | The element will be exposed by the OGC WPS interface     |
+----------+----------------------------------------------------------+
| test     | The element will use as value the one defined in the xml |
+----------+----------------------------------------------------------+

**Table 4: Scope data structure.**

|

+-----------------+------------------------------------------------------------------------------------------------------------------+
| Value           | Definition                                                                                                       |
+=================+==================================================================================================================+
| LiteralData     | Character String type, not empty (default type if not defined)                                                   |
+-----------------+------------------------------------------------------------------------------------------------------------------+
| BoundingBoxData | Coordinates of the Area Of Interest according to the format urn:ogc:def:crs:EPSG:6.6:4326                        |
+-----------------+------------------------------------------------------------------------------------------------------------------+
| opensearch      | Character String type, not empty. The value is used to query the source catalogue according to the target value. |
+-----------------+------------------------------------------------------------------------------------------------------------------+

**Table 5: Type data structure.**

|

Possible values (for the single parameter)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the case of type="LiteralData" (default "type" if not defined), the parameter element can be defined with:

* **no values. e.g.:** 

	.. code-block:: xml
	
		<parameter id="myparam"/>

* **a string value. e.g.:**

	.. code-block:: xml

	    <parameter id="myparam">My param value</parameter>
	
* **a list of <options>. e.g.:**

	.. code-block:: xml

	    <parameter id="myparam">
    	        <options>
                    <option>value1</option>
                    <option>value2</option>
                </options>
   	    </parameter>

	optionally it is possible to add a default value to the option list (to be picked from the list of the options):

	.. code-block:: xml

            <parameter id="myparam">
                <options>
                    <option>value1</option>
                    <option>value2</option>
                    <default>value1</default>
                </options>
            </parameter>

* **a defined dataType e.g.:**

	.. code-block:: xml

	    <parameter id="myparam" dataType="date"></parameter>
	    
	.. code-block:: xml

	    <parameter id="myparam" dataType="float"></parameter>
	    
	The dataType attribute can have one of these values: string, boolean, decimal, float, double, duration, dateTime, time, date, gYearMonth, gYear, gMonthDay, gDay, gMonth, hexBinary, base64Binary, anyURI, QName, integer, nonPositiveInteger, negativeInteger, long, int, short, byte, nonNegativeInteger, unsignedLong, unsignedInt, unsignedShort, unsignedByte, positiveInteger.
	The default dataType is string, associated when dataType is not specified.
	See https://www.w3.org/TR/xmlschema-2/#built-in-datatypes for all dataType descriptions.
	
* **a defined regular expression, with the metadata attribute, e.g.:**

	.. code-block:: xml

	    <parameter id="myparam" dataType="string" metadata="[a-zA-Z]*"></parameter>
	    
	.. code-block:: xml

	    <parameter id="myparam" dataType="string" metadata="^[0-9]{8}$ "></parameter>
	    
	
	


Default Job Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^
Tag definition
~~~~~~~~~~~~~~

.. code-block:: xml

	<jobTemplate>
		<defaultJobconf>
			<property></property>
		</defaultJobconf>
	</jobTemplate>

|
	
Attributes (for the single property)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+----------+----------------------------------+-----------+
| Name     | Data type and values             | Mandatory |
+==========+==================================+===========+
| id       | Character String type, not empty | Yes       |
+----------+----------------------------------+-----------+

**Table 6: Default property attributes.**

|

Possible IDs and values (for the single property)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+---------------------+-------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
| id                  | Data type and values    | Definition                                                                                                                                       |
+=====================+=========================+==================================================================================================================================================+
| mapred.task.timeout | nonNegativeInteger type | The number of milliseconds before a task will be terminated if it neither reads an input, writes an output, nor updates its status string.       |
+---------------------+-------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
| ciop.job.max.tasks  | nonNegativeInteger type | The number of parallel jobs to be ran, instantiating the job template. This number should fit with the number of available nodes on the cluster. |
+---------------------+-------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+

**Table 7: Possible configuration properties.**

|

In case of jobType="wps_client" a list of configuration properties has to be defined:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+------------------------------+----------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
| id                           | Data type and values             | Definition                                                                                                                                       |
+==============================+==================================+==================================================================================================================================================+
| ogc.wps.access.point         | Character String type, not empty | The end point of the remote WPS server. e.g.: http://remoteWPS:8080/wps/WebProcessingService                                                     |
+------------------------------+----------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
| ogc.wps.process.identifier   | Character String type, not empty | The name of the process of the remote OGC WPS server. e.g.: com.terradue.wps_oozie.process.OozieAbstractAlgorithm                                |
+------------------------------+----------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
| ogc.wps.storeExecuteResponse | true/false                       | True if the call to OGC WPS has to be asynchronous.                                                                                              |
+------------------------------+----------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
| ogc.wps.status               | true/false                       | True if the call to OGC WPS has to be asynchronous.                                                                                              |
+------------------------------+----------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+
| ciop.job.max.tasks           | nonNegativeInteger type          | The number of parallel jobs to be ran, instantiating the job template. This number should fit with the number of available nodes on the cluster. |
+------------------------------+----------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------+

**Table 8: Mandatory configuration properties in case of jobType = "wps_client".**

|

Workflow
-------------

Parent definition
^^^^^^^^^^^^^^^^^

Tag definition
~~~~~~~~~~~~~~

.. code-block:: xml

	<workflow></workflow>

|

Attributes
~~~~~~~~~~   
+----------+----------------------------------+-----------+---------+
| Name     | Data type and values             | Mandatory | For WPS |
+==========+==================================+===========+=========+
| id       | Character String type, not empty | Yes       | Yes     |
+----------+----------------------------------+-----------+---------+
| title    | Character String type, not empty | No        | Yes	    |
+----------+----------------------------------+-----------+---------+
| abstract | Character String type, not empty | No        | Yes	    |
+----------+----------------------------------+-----------+---------+

**Table 9: Workflow attributes.**

|

Workflow version
^^^^^^^^^^^^^^^^

Description
~~~~~~~~~~~~

The version number of the Workflow.


Tag definition
~~~~~~~~~~~~~~

.. code-block:: xml
	
	<workflow>
	    <workflowVersion></workflowVersion>
	</workflow>

|	
	
Attributes
~~~~~~~~~~

None

Example
~~~~~~~

.. code-block:: xml

    <workflowVersion>1.0</workflowVersion>

|

Nodes
^^^^^

Description
~~~~~~~~~~~~

Every step of the workflow needs a node section to define the I/O and the sequence of actions.

Tag definition
~~~~~~~~~~~~~~

.. code-block:: xml
	
	<workflow>
		<node></node>
	</workflow>

|

Attributes
~~~~~~~~~~   
+----------+----------------------------------+-----------+
| Name     | Data type and values             | Mandatory |
+==========+==================================+===========+
| id       | Character String type, not empty | Yes       |
+----------+----------------------------------+-----------+

**Table 10: Node attributes.**

|

Job
^^^^

Description
~~~~~~~~~~~~

Every node instantiates a job template.

Tag definition
~~~~~~~~~~~~~~

.. code-block:: xml
	
	<node>
		<job></job>
	</node>

|
	
Attributes
~~~~~~~~~~   
+----------+-------------------------------------------------------------------------+-----------+
| Name     | Data type and values                                                    | Mandatory |
+==========+=========================================================================+===========+
| id       | Character String type, not empty, picked from the job templates section | Yes       |
+----------+-------------------------------------------------------------------------+-----------+

**Table 11: Job attributes.**

| 

Sources
^^^^^^^

Description
~~~~~~~~~~~~

Here you can define the inputs of the workflow's step. According to the cardinality of the source, the process will be instantiated in a number of different processes.

Tag definition
~~~~~~~~~~~~~~

.. code-block:: xml
	
	<node>
		<sources>
			<source></source>
		</sources>
	</node>

|    
    
Attributes
~~~~~~~~~~   
+----------+---------------------------------------+-----------+----------------------+
| Name     | Data type and values                  | Mandatory | If "scope = runtime" |
+==========+=======================================+===========+======================+
| id       | Character String type, not empty      | No        | Yes                  |
+----------+---------------------------------------+-----------+----------------------+
| refid    | sourceType data structure, Table 13   | No        | Yes                  |
+----------+---------------------------------------+-----------+----------------------+
| title    | Character String type, not empty      | No        | Yes	              |
+----------+---------------------------------------+-----------+----------------------+
| abstract | Character String type, not empty      | No        | Yes	              |
+----------+---------------------------------------+-----------+----------------------+
| scope    | Scope data structure, Table 4         | No        | -                    |
+----------+---------------------------------------+-----------+----------------------+

**Table 12: Source attributes.**

|

+-------------+----------------------------------+------------------------------------------------------------------------------------------------------+
| id          | Data type and values             | Definition                                                                                           |
+=============+==================================+======================================================================================================+
| string:list | Character String type, not empty | A list of strings comma separated                                                                    |
+-------------+----------------------------------+------------------------------------------------------------------------------------------------------+
| \file:urls  | Character String type, not empty | The full path of a file containing the list of inputs                                                |
+-------------+----------------------------------+------------------------------------------------------------------------------------------------------+
| cas:series  | Character String type, not empty | The description URL of a catalogue series (cas). Each dataset returned by the query will be an input |
+-------------+----------------------------------+------------------------------------------------------------------------------------------------------+
| wf:node     | Character String type, not empty | The id of a previous node from which to take the output                                              |
+-------------+----------------------------------+------------------------------------------------------------------------------------------------------+

**Table 13: sourceType data structure.**

|

Parameters
^^^^^^^^^^^^^^^^^^

Description
~~~~~~~~~~~~

The workflow parameters for the node. You can override the attributes and values of the default parameters section of the relative job template. It is not possible to add new parameters in this section.


Tag definition
~~~~~~~~~~~~~~

.. code-block:: xml

	<node>
		<parameters>
			<parameter></parameter>
		</parameters>
	</node>

|
	
Attributes (for the single parameter)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+
| Name     | Data type and values                                                                                                                          | Mandatory |
+==========+===============================================================================================================================================+===========+
| id       | Character String type, not empty. It must be one of the parameters defined in the JobTemplates                                                | Yes       |
+----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+
| scope    | Scope data structure, Table 4                                                                                                                 | No        |
+----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+
| type     | Type data structure, Table 5                                                                                                                  | No        |
+----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+
| target   | Query parameter from the description of the source catalogue (mandatory in case of type="opensearch")                                         | No        |
+----------+-----------------------------------------------------------------------------------------------------------------------------------------------+-----------+

**Table 14: Parameters attributes.**

|

Possible values (for the single parameter)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The possible values for the single parameter are the same as for the Default Parameters. So in the case of type="LiteralData" (default "type" if not defined), the parameter element can be defined with:

* **no values** 

* **a string value**
	
* **a list of <options>**

|

A complete example
------------------

Download the file :download:`Application.xml complete example <./application.xml>` to view an application descriptor file featuring all the tags and parameters referenced in this guide.

Application descriptor schema
-----------------------------

You can find the schema definition on your Developer Cloud Sandbox under: 

.. code-block:: bash

	/usr/lib/ciop/schemas/application.xsd
