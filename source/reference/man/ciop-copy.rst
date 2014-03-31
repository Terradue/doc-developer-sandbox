ciop-simjob(7)
==============

Synopsis
--------

**ciop-simjob** [<OPTIONS>] [node]

Description
-----------

``ciop-simjob`` runs individually a node of the sample workflow of the
application. This is useful to test unitarily a job.

Options
-------

``node``
    This must be the id of the node registered in the workflow "sample"
    in the file ${\_CIOP\_APPLICATION\_PATH}/application.xml

``-i input``
    directory name or file name containing the input to map to the
    executable via stdin. This path must be relative to share path
    ${\_CIOP\_SHARE\_PATH}

    By default the value is defined by the framework to find the inputs
    of previous node(s) in the workflow (if any)

``-o output``
    directory name where to put the output file with the stdout of the
    execution This directory must not exist (or use -f) and must be
    relative to share path ${\_CIOP\_SHARE\_PATH}

    By default the value is defined by the framework to provide the
    generated outputs to the child node(s) in the workflow (if any)

``-f``
    delete existing output directory if it exists (default: no)

``-n``
    list the node IDs of the workflow

Exit Status
-----------

``ciop-simjob`` command exits 0 on success, and >0 if an error occurs.

Examples
--------

Get the workflow node IDs

.. code-block:: bash

                        ciop-simjob -n

First run of a given node                

.. code-block:: bash

                        ciop-simjob node_name
                
Following runs of a given node (deletes the results of a previous run)

.. code-block:: bash

                        ciop-simjob -f node_name
                

See Also
--------

`ciop-simwf <ciop-simwf>`_

Author
======

Terradue
