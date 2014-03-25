Design Guide
############

Building the workflow
*********************

What is a workflow
==================

Picture the workflow as a Data Pipeline.

A data pipeline is a data workflow service that helps you process and move data between different processing steps.

The processing steps are the edges of a Directed Acyclic Graph (DAG). 

A directed graph may be used to represent a network of processing elements; in this formulation, data enters a processing element through its incoming edges and leaves the element through its outgoing edges.


Processing elements
-------------------

A processing element is an edge of the DAG. 

Processing edges can have different sources types:

* catalogue feed  <catalogue_feed/index>
* comma separated values list <csv_list/index>
* file <file/index>
* the output of one or more parent edges of the DAG <parent_edges>

Part 1.1.1
^^^^^^^^^^

some text

Part 1.1.1.1
""""""""""""

some text
