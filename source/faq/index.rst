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

To generate a DCS Application archetype, you have just to log on your Cloud Sandbox, and type:

.. code-block:: console

  cd
  mvn archetype:generate

Select the entry relative to the application archetype you want to use.
Currently, archetypes are available for: python, bash.

In this example, the option 2 (bash) is selected:

.. code-block:: console

  Choose archetype:
  1: -> com.terradue.ciop.app:dcs-python-archetype (Archetype for Developer Cloud Sandbox Python Applications)
  2: -> com.terradue.ciop.app:dcs-bash-archetype (Archetype for Developer Cloud Sandbox Bash Applications)
  Choose a number or apply filter (format: [groupId:]artifactId, case sensitive contains): : 2

Then set the 'groupId', 'artifactId', 'version' and 'package' values for your project. 
For example:

.. code-block:: console

  Define value for property 'groupId': : com.terradue
  Define value for property 'artifactId': : myapp
  Define value for property 'version':  1.0-SNAPSHOT: : 
  Define value for property 'package':  com.terradue: : myapp

NOTE: the 'version' will be set by default to '1.0-SNAPSHOT'.

After that, you will see a folder with the name of the artifactId (here myapp).
You can start building your application from this structure, offering you a powerful mean to handle your Application's packaging, sharing, and Cloud deployments.

In that folder, the resulting maven configuration file 'pom.xml' will have initial tags similar to:

.. code-block:: bash

  <groupId>com.terradue</groupId>
  <artifactId>myapp</artifactId>
  <packaging>pom</packaging>
  <name>dcs-bash</name>
  <description>dcs-bash</description>
  <version>1.0-SNAPSHOT</version>

To learn more: https://maven.apache.org/pom.html#Properties

How shall I compile code on my Developer Cloud Sandbox environment?
-------------------------------------------------------------------

If you need to compile your own application from source, or an application that is not available via a yum repository, you can work from the APPLICATION filesystem (see :ref:`principles`) on your Hadoop Sandbox VM. 
Use that filesystem to compile your source code. 

For example, if you are using *make*, you can configure the install location with:

.. code-block:: console

  ./configure --prefix=$_CIOP_APPLICATION_PATH/<your-app>

How can I stop a running job or workflow?
------------------------------------------

There are two different ways:

* To stop all the running workflows:

.. code-block:: console

  ciop-stop -a

* To stop a specific workflow:

.. code-block:: console

  ciop-stop <workflow_id>

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

