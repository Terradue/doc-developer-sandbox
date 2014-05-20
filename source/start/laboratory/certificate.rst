.. _certificate:

Importing your SSL Certificate
==============================

The Secure Socket Layer (SSL) is the most widely deployed security protocol used today. It is essentially a protocol that provides a secure channel between two machines operating over the Internet or an internal network.

The SSL Certificate issued by the Terradue Certification Authority (CA) is used to access securely the Terradue's infrastructure. It should be imported into a browser in order to use it. This guide provides importing procedures for different browsers and platforms.

Prerequisites
-------------

- You received an e-mail with subject "Developer Cloud Sandboxes service  -  Invitation to register",
- You made a request for registration following the instructions in the e-mail,
- Your request was approved and you received an e-mail from ca@terradue.com with subject "Your Terradue certificate is ready to download.".

Download the Certificate in PFX format
--------------------------------------

- Go to https://ca.terradue.com/gpodcs/cgi/certdown.cgi?U=name@organization.com&F=Kpfx (*use your registration e-mail instead of name@organization.com*)
- Type the certificate password that you chose during the registration.

Import the Certificate in a Browser
-----------------------------------

Google Chrome
^^^^^^^^^^^^^

- Open the Google Chrome browser,

- Choose **Preferences** from the **Chrome** menu,

- Click the **Show advanced settings...** link,

- Open the **Manage Certificates** button under the **HTTPS/SSL** section,

- Open the Import window, browse to your downloaded certificate file,

- Enter your certificate passphrase when prompted.

Mozilla Firefox
^^^^^^^^^^^^^^^

- Open the Firefox browser,

- Open the Preferences / Options: 

  - *(Linux)* Choose **Preferences** from the **Edit** menu,
  - *(Windows)* Choose **Options** from the **Tools** menu,
  - *(Mac)* Choose **Preferences** from the **Firefox** menu

- Click the **Advanced** button,

- Open the Certificate pane:

  - *(Linux)* Select the **Security** pane,
  - *(Windows)* Select the **Encryption** (or **Security**) pane,
  - *(Mac)* Select the **Certificates** pane

- Click the **View Certificates** button,

- Click the **Authorities** tab,

- Click the **Import** button at the bottom of the screen,

- Browse to your downloaded certificate file, 

- Enter your certificate passphrase when prompted.

Internet Explorer
^^^^^^^^^^^^^^^^^

- Open the Internet Explorer browser,

- Choose **Internet Options** from the **Tools** menu,

- Click the **Content** tab,

- Open the **Certificate** pane,

- Click the **Certificates** (or **Personal**) button,

- Browse to your downloaded certificate file,

- Enter your certificate passphrase when prompted.

Safari
^^^^^^

- Double-click the downloaded certificate file to launch the Keychain Access application,

- Enter your certificate passphrase when prompted.
