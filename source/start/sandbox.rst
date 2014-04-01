Connect to your Sandbox
========================

To connect your Sandbox you need a secure connection with the Terradue's infrastructure. Following this guide you will be able to access your Sandbox through the Secure Shell (SSH) network protocol.

Prerequisites
-------------

- You completed successfully the guide *Importing the Terradue's SSL Certificate* :doc:`certificate`,
- You receveid an email from support@terradue.com where the subject contains "First connection",
- You have the <sandbox_user> and the <sandbox_host> information, provided by the "First connection" e-mail.

Download the Certificate in PEM format
--------------------------------------

- Go to https://ca.terradue.com/gpodcs/cgi/certdown.cgi?U=name@organization.com (use your registration e-mail instead of name@organization.com),

- Choose as **Certificate Format** the PEM,

  - *(Alternative)* If you are using Windows (see below) or if you don't want type the passphrase each time you want to access the Sandbox, choose as **Certificate Format** the PEM (Unencrypted key), 
  
- Type the certificate passphrase that you chose during the registration, when prompted,

- Store securely the PEM Certificate in your filesystem, especially if you chose the PEM (Unencrypted key) format.

Connecting from Unix / Linux / Mac
----------------------------------

- Open a Terminal,

- Type:

.. code::

  chmod 600 <yourcertificate.pem>
  ssh -i <yourcertificate.pem> <sandbox_user>@<sandbox_host>

- If you chose PEM format when you downloaded the Certificate, provide the passphrase when prompted.

That's all :-)

Connecting from Windows
------------------------

Download and install PuTTY
^^^^^^^^^^^^^^^^^^^^^^^^^^

PuTTY is a well-known freely available SSH client http://www.putty.org/. To download and install it:

- Go to http://the.earth.li/~sgtatham/putty/latest/x86/putty.zip,

- Unzip the downloaded file in a location of your filesystem that you prefer.
  
Generate a Private Key from the PEM Certificate
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

PuTTY needs a private key file (.ppk). Here the procedure to generate it from a PEM Certificate:

- Open the PEM Certificate **Unencrypted key format** with a text editor (e.g. Notepad), 

- Copy in your clipboard the part:

.. code::

  -----BEGIN RSA PRIVATE KEY-----
  MII....
  -----END RSA PRIVATE KEY-----

- Create a new empty file named <yourcertificate>.private, open it with a text editor (e.g. Notepad) and paste the part that you copied in the previous point, 

.. NOTE::
  You should paste also -----BEGIN RSA PRIVATE KEY----- and -----END RSA PRIVATE KEY----- in the file <yourcertificate>.private

- Open a Command Prompt and type:

.. code::

  puttygen <yourcertificate>.private
  
- Store securely in your filesystem the private key generated, naming it in <yourcertificate>.ppk .

*(Alternative)*

Use the import function in the puttygen GUI:

- Double-click on the puttygen executable,
  
- Click on the **Import** command from the **Conversions** menu,

- Click on the **Save private key** button,

- Store securely in your filesystem the private key generated, naming it in <yourcertificate>.ppk .

Connect with PuTTY
^^^^^^^^^^^^^^^^^^

- Open a Command Prompt and type:

.. code::

  putty -i <yourcertificate>.ppk <sandbox_user>@<sandbox_host>

That's all :-)

.. NOTE::
  The PEM certificate is not used to access the system with PuTTY. Only the generated <yourcertificate>.ppk file is needed.

Connecting from iPad
--------------------
