.. _introduction:

Introduction
############

This guide will drive you step by step through the setup of your Developer Cloud Sandbox environment.
We will go through steps such as user registration, instantiation of a Developer Cloud Sandbox, and secured remote access to it.

This Getting Started Guide will also provide you with general information about the services and tools at your disposal in the PaaS (Platform as a Service) environment, and some key principles to understand how to integrate your own application for the Cloud.

Prerequisites

1) You have a valid certificate registered
2) You have imported your certificate in your web browser following this procedure Import Certificate in web browser
3) You have installed your pre-configured OpenVPN client, that is successfully accessing Terradue's VPN server Setup your VPN client

Connect to your Sandbox: follow the instructions provided in SSH Connexion.
Have a quick tour of the main features: there's Developer's Quick Start just for that !
Start integrating an application: now you have your Cloud Sandbox main controls in hand. You may continue with the Field Guide. This will drive you through hands-on exercises for domain-specific applications, and useful guidance to integrate and test your own applications.

SSH connexion
+++++++++++++

Pre-conditions

To access your Sandbox, you need a secure connection (via ssh or putty)
You will make use of your private keys to establish the handshake with the infrastructure.

Your X.509 certificate was generated during your initial Registration step.
Your Sandbox IP, or <sandboxhost>, was provided in your "First connection" email.
Edit
Connecting from Unix / Linux (using ssh)

    The user downloads his X.509 certificate from the user management portal (e.g. in PEM format), either with encrypted private key (recommended) or unencrypted private key (not recommended)
    On the command line, the user can now directly access the VM using:

ssh -i <username>.pem <username>@<sandboxhost>

Depending on the downloaded format, the user has to provide his passphrase (if encrypted key was downloaded) or not (if the key was downloaded unencrypted).
Edit
Connecting from Windows (using putty)

If the user wants to login from Windows using putty (a well-known freely available ssh client), the key must be converted into a putty-compatible format first:

    The user must download his X.509 certificate from in PEM format [*with unencrypted key*].
    From the file, the private key must be extracted manually (using a text editor): Copy the part

-----BEGIN RSA PRIVATE KEY-----
MII....
-----END RSA PRIVATE KEY-----

and paste it into a new file named e.g. <user>.private. Make sure this file is in a secure and safe place.

    This private key must now be imported with puttygen either on the command line:

puttygen <user>.private

    or using the import or load function in puttygen. The import should succeed with the following message:

(image - PuTTY Key Generator)

The file must now be saved as private key either with (recommended) or without (not recommended) passphrase. Preferably name the resulting key <user>.ppk by clicking the "Save private key" button in the screen below:

(image - Save private key as)


    Now the user can access the VM with putty in the command line:

    putty -i <user>.ppk <user>@<sandboxhost>


    or save the corresponding info in a Pageant session with the following four steps: In the session dialog, the "Host Name (or IP address)" field needs to be set to <sandboxhost> (Protocol SSH, Port 22):

    The, <user> must be added to the "Auto-login username" field in the Connection dialog:

and the created private key file needs to be referenced in the "Private key file for authentication" field of the Auth dialog:

Finally, the session can be saved (Session dialog) or just opened (Open button below).

    Make sure that the unencrypted X.509 PEM certificate is deleted (or at least stored in a secure and safe location) after this setup. The X.590 PEM certificate is not used to access the system with putty. Only the generated <user>.ppk file is needed.
