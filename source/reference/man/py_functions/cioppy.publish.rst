ciop.publish
===========

Description
-----------

Publishes results to the distributed file system (or CLoud sotorage) or the results location or echoes strings as inputs to the subsequent nodes in the workflow

Usage
-----

.. code-block:: python

  import cioppy
  ciop = cioppy.Cioppy()

  ciop.publish (sources, base_path="", mode="", driver="", recursive=False, metalink=False)

Arguments
---------

``sources``
  the path to the result of folder to publish

``base_path``
  strips the base path of the result

``mode``
  if mode is set to "silent", ciop.publish will echo the content of ``path`` as inputs to the subsequent nodes in the workflow
  if mode is set to "anonymous", ciop.publish will publish the results without echoing the resulting path(s) as input(s) to the subsequent nodes in the workflow
  this mode overrides the ``recursive``, ``metalink`` and ``driver`` options

``driver``
  set the value to S3 and the results will be published to the Cloud storage

``recursive``
  if set to True will traverse the folder tree and publish all files

``metalink``
  if set to True the published results will be an item in the results' metalink

Details
-------

This function stages-out local files to the distributed filesystem or Cloud or allows defining the inputs passed to the next nodes in the workflow.

Value
-----

List with:

* exit.code: 0 if succesful, >0 if unsuccessful
* output: path of the published product

Examples
--------

.. code-block:: python

  ciop.publish('/tmp/pippo.tif', metalink = True)


Author
------

Terradue
