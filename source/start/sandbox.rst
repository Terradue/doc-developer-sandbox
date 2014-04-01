Connect to your Sandbox
========================

Prerequisites
-------------

- You 

To access your Sandbox, you need a secure connection (via ssh or putty)
You will make use of your private keys to establish the handshake with the infrastructure.

Your X.509 certificate was generated during your initial Registration step.
Your Sandbox IP, or <sandboxhost>, was provided in your "First connection" email.

Download the Certificate in PEM format
--------------------------------------

- Go to https://ca.terradue.com/gpodcs/cgi/certdown.cgi?U=name@organization.com (use your registration e-mail instead of name@organization.com),
- Choose as **Certificate Format** the PEM format,
- Type the certificate password that you chose during the registration when prompted.

Connecting from Unix / Linux
-----------------------------


The user downloads his X.509 certificate from the user management portal (e.g. in PEM format), either with encrypted private key (recommended) or unencrypted private key (not recommended)
    On the command line, the user can now directly access the VM using:

ssh -i <username>.pem <username>@<sandboxhost>

Depending on the downloaded format, the user has to provide his passphrase (if encrypted key was downloaded) or not (if the key was downloaded unencrypted).

Connecting from Windows
------------------------

(using putty)

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
