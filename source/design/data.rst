Data preparation and management
===============================

A processing workflow is a data pipeline. How does the data reach the data pipeline? 

There are several appraoches to provide data to the data pipeline



DELETE AFTER REVISION

Processing edges can have different sources types:

* :doc:`catalogue feed <catalogue_feed/index>`
* comma separated values list <csv_list/index>
* file <file/index>
* the output of one or more parent edges of the DAG <parent_edges>

Passing complex data from a node to another
-------------------------------------------

Sometimes the output of a node is somposed of several set of files.
The following example shows how to pass a "dim" data.


