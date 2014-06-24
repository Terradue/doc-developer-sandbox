.. _discover:

Discover the Sandbox services & tools
#####################################

User dashboard Web UI
+++++++++++++++++++++

Accessed from the VPN at the address: http://<your_sandbox_host>/dashboard 

The Dashboard provides:

* The Sandbox status information (name, owner, security, network, disks)
* An editor for the Application Descriptor XML file
* A debug wizard presenting the workflows launched with the command ciop-simwf, as managed by Hadoop Oozie
* A processing invocation client, interacting with Hadoop via a Web Processing Service (WPS) interface
* A Cloud Service health monitoring (CPU consumption, Disk usage, Cluster status)
* A Ticketing system client to interact with the Platform Support team
 
Job Tracker Web GUI
+++++++++++++++++++

To view processes launched with the ciop-simjob command you can use the Hadoop Job Tracker.

Accessed from the VPN at the address: http://<your_sandbox_host>:50030/jobtracker.jsp

Cloud Storage
+++++++++++++

A virtual storage available from your Laboratory, accessed via the standard S3 interface:

* s3://<your_laboratory>-public/ for open data repositories
* s3://<your_laboratory>-shared/ for shared data repositories accross selected partners
* s3://<your_laboratory>-private/ for your own and exclusive usage

Data Catalogues
+++++++++++++++

Accessed from the VPN:

* sandbox catalogue http://<your_sandbox_host>/catalogue/search

The ciop tools
++++++++++++++

The CIOP tools are part of your PaaS development environment.
They form a set of API to manage the data flows (stage-in/out) and are accessed from within the Streaming executable scripts declared in your job templates.

