Frequently asked questions
##########################

How can I get support?
------------------------------

If you are a registered user of the Terradue Cloud Platform (see :ref:`introduction`) you can request support from https://support.terradue.com (login with your credentials).
This is your collaborative workspace, where you can issue tickets to interact with the Operations Support team at Terradue. 
The support environment offers tools for reporting bugs, requesting help and sharing experience.

If you are not yet a registered user of the Terradue Cloud Platform,
access can be requested from the ESA Research & Service Support Portal, for ESA registered users (e.g. G-POD related projects),
or you can send us a request for quotation by email at info@terradue.com.

How to initialize a DCS Application?
------------------------------------

To generate the DCS Application archetype, you have just to:

Logon on a Sandbox, and type:

.. code-block:: console

  cd
  mvn archetype:generate

Select the entry relative to the application archetype you want to use (the current available archetypes are python, bash).

Set the artifact.id, group.id, version and package.id values for your project.
After that you will see a folder with the name of the artifact.id.
You can start building your application from this structure.

How shall I compile code on my Developer Cloud Sandbox environment?
-------------------------------------------------------------------

If you need to compile your own application from source, or an application that is not available via a yum repository, you can work from the APPLICATION filesystem (see :ref:`principles`) on your Hadoop Sandbox VM. 
Use that filesystem to compile your source code. 

For example, if you are using *make*, you can configure the install location with:

.. code-block:: console

  ./configure --prefix=$_CIOP_APPLICATION_PATH/<your-app>

How can I stop a running job or workflow?
------------------------------------------

There are two different cases:

* If you start a job through the command *ciop-simjob* (i.e. by executing a single node of the workflow), you can stop it with:

.. code-block:: console

  hadoop job -Dmapred.job.tracker=<sandbox_host>:8021 -kill <job_id>

* If you start a workflow through the command *ciop-simwf* (i.e. by executing the entire wokflow)

.. code-block:: console

  oozie job -oozie http://localhost:11000/oozie -kill <workflow_id>

Why are some log entries going to stderr while others go to stdout?
-----------------------------------------------------------------------------------------

The framework log entries (e.g. using ciop-log or ciop-copy) all go to stderr.

Application log entries may go to stderr or stdout depending on the application it self.

Example: 

.. code-block:: bash

  ls missing_file
  
the message *ls: cannot access missing_file: No such file or directory* will go to stderr since this is how *ls* behaves.

.. code-block:: bash

  echo 'Hello World!'
  
The message *Hello World!* will go to stdout

