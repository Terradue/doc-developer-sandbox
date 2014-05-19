Using GitHub
============

GitHub is a web-based hosting service for software development projects that use the Git revision control system. 

GitHub offers both paid plans for private repositories, and free accounts for open source projects.

Laboratories and GitHub organizations
+++++++++++++++++++++++++++++++++++++

Developer Cloud Sanbox laboratories have a one-to-one relationship with GitHub organizations meaning that every laboratory has an equivalent GitHub organization.

.. INFO:: According to your plan, the GitHub organization can host private repositories

Organizing the GitHub teams
+++++++++++++++++++++++++++

Whithin a GitHub organization, you can organize as many teams including any number of members (typically developers).

Owners have full access to all repositories and have admin rights to the organization. 

Created teams can have several levels of priviliedges:

* Read Access: This team will be able to view and clone its repositories. 
* Write Access: This team will be able to read its repositories, as well as push to them.
* Admin Access: This team will be able to push/pull to its repositories, as well as add other collaborators to them.

.. TIP:: We recommend managing teams with a reduced number of member within a team with write access. The remaining team members with Read only access are invited to fork the repository and submit pull requests. The owners can then moderate these requests. 

Organizing the repository
+++++++++++++++++++++++++

The repository should follow the structure below:

.. code-block:: bash

  README.md # the markdown file used to generate the html summary seen at the bottom of projects. 
  .gitignore # Git uses it to determine which files and directories to ignore, before making a commit.
  pom.xml # the Project Object Model file containing information about the project and configuration details used by Maven to build the project
  /src # root folder of the application
    /main
      /app-resources
        application.xml
        /job_template1
          run.sh
          /etc
          /bin
        /job_template2
          ...
      /java # if your application has Java code
      /resources # resources used to build the application
      /...
      
.. seealso:: Have a look at the BEAM Java tutorial which implements the recommended structure: https://github.com/Terradue/BEAM-Java-tutorial

The typical application development workflow
++++++++++++++++++++++++++++++++++++++++++++

Cloning an existing repository
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You'll need the SSH clone URL in the form: git@github.com:Terradue/BEAM-Java-tutorial.git

Log on the sandbox using your key:

.. code-block:: bash

  ssh -A -i ~/.ssh/<name>.pem <sandbox ip> 
  
Example:

.. code-block:: bash

  ssh -A -i ~/.ssh/mrossi.pem 10.14.10.20

Run the commands on the shell:

.. code-block:: bash

  cd 
  git clone git@github.com:Terradue/BEAM-Java-tutorial.git

Creating a new repository on github.com
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The procedure is describe here: https://help.github.com/articles/creating-a-new-repository

.. TIP:: Make sure to create a README.md file to enable cloning as described above

Building the application
^^^^^^^^^^^^^^^^^^^^^^^^

Once the repository contains the structure described above, use *maven* to build and install the application for you:

.. code-block:: bash

  cd ~/BEAM-Java-tutorial
  mvn install
  
This will use the information available in the *pom.xml* file to build your application and copy the files to the */application* file system.

At this point you can use ciop-simjob and ciop-simwf to test the application

Updating files
^^^^^^^^^^^^^^

Whilst editing the files in */application* may seem the most obvious way to change your application it also the way to loose changes.

In fact, you should edit the files in the **source** which has been cloned in your */home* folder and use mvn install to update the build which is in */application* with mvn install

Releasing the application
^^^^^^^^^^^^^^^^^^^^^^^^^

To create releases of the application on GitHub use *mvn deploy*:

.. code-block:: bash

  cd ~/BEAM-Java-tutorial
  mvn deploy

Documenting the application
^^^^^^^^^^^^^^^^^^^^^^^^^^^

We suggest usingthe GitHub Pages and sphinx to document the application.

The GitHub pages are public webpages freely hosted and easily published through the GitHub site.

.. WARNING:: the GitHub pages of a private repository will be public and thus visible to anybody!

.. TODO:: add process

Going further
+++++++++++++

There are several high quality free ebooks on the Web (e.g. http://gitbookio.github.io/git/en/) and GitHub provides a comprehensive web-site to get started here: https://help.github.com/




