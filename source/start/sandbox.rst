Connect to your Sandbox
========================

To connect your Sandbox you need a secure connection with the Terradue's infrastructure. Following this guide you will be able to access your Sandbox through the Secure Shell (SSH) network protocol.

Prerequisites
-------------

- You completed successfully the guide *Importing the Terradue's SSL Certificate* :doc:`certificate`,
- You receveid an email from support@terradue.com where the subject contains "First connection",
- You have the <username> and the <sandboxhost> information, provided by the "First connection" e-mail.

Download the Certificate in PEM format
--------------------------------------

- Go to https://ca.terradue.com/gpodcs/cgi/certdown.cgi?U=name@organization.com (use your registration e-mail instead of name@organization.com),

- Choose as **Certificate Format** the PEM,

  - *(Alternative)* Choose as **Certificate Format** the PEM (Unencrypted key). In this case you won't prompted for the passphrase each time you will use the Certificate (it is in general not recommended)
  
- Type the certificate passphrase that you chose during the registration, when prompted,

- Store securely the PEM Certificate in your filesystem, especially if you chose the PEM (Unencrypted key) format.

Connecting from Unix / Linux / Mac
----------------------------------

- Open a Terminal,

- Type:

`ssh -i /path/to/your/pem <username>@<sandboxhost>`

- If you chose PEM format when you downloaded the Certificate, you have to provide the passphrase,

- That's all :-)

Connecting from Windows
------------------------

Download Putty
^^^^^^^^^^^^^^

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
