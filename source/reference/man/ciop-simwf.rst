ciop-simwf(7)
=============

``ciop-simwf`` executes the complete workflow and house keeping functions to list and delete runs

Synopsys
--------

.. code-block:: bash

  ciop-simwf [<options>]


Description
-----------

``ciop-simwf`` runs the complete workflow of the application. Each
workflow execution is called a "run". The "run" results are stored on
the sandbox distributed filesystem each with a unique identifier. Run
results can be then compared. If used without argument, ciop-simwf will
show the workflow execution until completion. This beahviour can be
interrupted with crtl+C without interrupting the workflow execution. The
workflow execution can also be tracked in the Sandbox dashboard.
ciop-simwf can be used to list and delete runs.

Options
-------

``-l``
    returns the workflow run ids

``-d  run_id``
    deletes the run\_id files on the sandbox

Exit Status
-----------

``ciop-simwf`` command exits 0 on success, and >0 if an error occurs.

Examples
--------

Execute the workflow as defined in the application descriptor file ${_CIOP_APPLICATION_PATH}/application.xml

:: code-block:: bash

                        ciop-simwf
                
List run ids

:: code-block:: bash

                        ciop-simwf -l
                
Delete the files of a given run id (as returned by ciop-simwf -l)

:: code-block:: bash

                        ciop-simwf -d run_id
                

See Also
--------

`ciop-simjob <ciop-simjob`_

Author
------

Terradue
