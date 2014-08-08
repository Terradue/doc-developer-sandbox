Frequently asked questions
##########################

**How can I get support?**

If you are registered to our infrastructure (see :ref:`introduction`) you can use the Support site, available at https://support.terradue.com.

If you are not yet registered to our infrastructure you can send us an email at support@terradue.com

**I would to compile my own application from source, or an application not available via the yum package manager. How can I do?**

In the Sandbox you can find the APPLICATION filesystem (see :ref:`principles`). You can use that filesystem to compile your source code. If you are using *make*, you can configure the install location with:

.. code-block:: console

  ./configure --prefix=$_CIOP_APPLICATION_PATH/<your-app>

**How can I stop a running job or workflow?**

There are two different cases:

* If you start a job through the command *ciop-simjob* (i.e. by executing a single node of the workflow), you can stop it with:

.. code-block:: console

  hadoop job -Dmapred.job.tracker=<sandbox_host>:8021 -kill <job_id>

* If you start a workflow through the command *ciop-simwf* (i.e. by executing the entire wokflow)

.. code-block:: console

  oozie job -oozie http://localhost:11000/oozie -kill <workflow_id>

**Why are some log entries going to stderr while others go to stdout?**

The framework log entries (e.g. using ciop-log or ciop-copy) all go to stderr.

Application log entries may go to stderr or stdout depending on the application it self.

Example: 

.. code-block:: bash

  ls missing_file
  
the message *ls: cannot access missing_file: No such file or directory* will go to stderr since this is how *ls* behaves.

.. code-block:: bash

  echo 'Hello World!'
  
The message *Hello World!* will go to stdout
