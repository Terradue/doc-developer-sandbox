ciop-run
========

Synopsis
--------

``ciop-run`` [options] [node_id]

Description
-----------

ciop-run executes either an application workflow or, if the node_id is provided, a single step of the application workflow.

Options
-------

``-d, --debug``
    Enter in debug mode.
    Default: false

``-f, --force``
    Force the execution when application.xml has changed from the previous run.
    Default: false

``-g, --graph``
    Display a graph of the nodes (experimental).
    Default: false

``-h, --help``
    Display help informations.
    Default: false

``-i, --inputs``
    A file containing the inputs (source) for the workflow.

``-l, --list``
    Provide the list of the previous workflows and Status. If a node id is provided, all the successful previous run are listed.
    Default: false

``-n, --nodes``
    Display a list of the nodes.
    Default: false

``-P, --param``
    Runtime parameter values. Syntax: -Pkey=value
    Default: {}

``-p, --pfile``
    A file containing the parameters for the workflow.

``-S, --source``
    Runtime source values. Syntax: -Skey=value
    Default: {}

``-w, --workflowfId``
    The previous workflow id to use as input (e.g., 0000001-140613165901451-oozie-oozi-W).

Exit Status
-----------

``ciop-run`` command exits with

* 0 on success
* 1 an error occured
* any other exit code is from the executable itself

Examples
--------

.. code-block:: bash

  ciop-run my_node

Author
------

Terradue
