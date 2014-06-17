.. _introduction:

+--------------------------+------------------------------------+----------+----------+
| Header row, column 1     | Header 2                           | Header 3 | Header 4 |
| (header rows optional)   |                                    |          |          |
+==========================+====================================+==========+==========+
| body row 1, column 1     | column 2                           | column 3 | column 4 |
+--------------------------+------------------------------------+----------+----------+
| .. note:: this is a note | .. uml::                           |          |          |
|                          |                                    |          |          | 
|                          | !define DIAG_NAME Workflow example |          |          |
|                          | !include includes/skins.iuml       |          |          |
|                          | skinparam backgroundColor #FFFFFF  |          |          |
|                          | skinparam componentStyle uml2      |          |          |
|                          | start                              |          |          |
|                          | :Node A;                           |          |          |
|                          |   fork                             |          |          |
|                          |    :Node B;                        |          |          |
|                          |  fork again                        |          |          | 
|                          |    :Node C;                        |          |          |
|                          |  end fork                          |          |          |
|                          |    :Node D;                        |          |          | 
|                          |  stop                              |          |          |
|                          | footer                             |          |          | 
|                          | DIAG_NAME                          |          |          |
|                          | endfooter                          | ...      |          |
+--------------------------+------------------------------------+----------+----------+



Introduction
############

This guide will drive you step by step through the setup of your Developer Cloud Sandbox environment.
We will go through steps such as user registration, instantiation of a Developer Cloud Sandbox, and secured remote access to it.

This Getting Started Guide will also provide you with general information about the services and tools at your disposal in the PaaS (Platform as a Service) environment, and some key principles to understand how to integrate your own application for the Cloud.

The 'must do', but once should be enough :)

1. Register on the infrastructure: 

- you'll need have a valid certificate (get it `here <https://ca.terradue.com/gpodcs/pub/certreq.html>`_)

.. NOTE:: Please remember that the password for your certificate and for your account are the same  

2. Join your laboratory: 

- import your certificate in your web browser following this procedure - :doc:`Import Certificate in web browser <laboratory/certificate>`
- install your pre-configured OpenVPN client, that shall successfully access Terradue's VPN server - Setup your VPN client

3. Connect to your Sandbox: 

- follow the instructions provided in SSH Connexion.

4. Have a quick tour of the main features: 

- there's Developer's Quick Start just for that !


Once you have passed throught these steps, you are ready !
You have your Cloud Sandbox main controls in hand. You can start integrating an application.
As a suggested phase you may continue with the Field Guide. This will drive you through hands-on exercises for domain-specific applications, and useful guidance to integrate and test your own applications.
