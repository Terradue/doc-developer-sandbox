Join your Laboratory
####################

A Laboratory is a virtual network on Terradue's Cloud Platform dedicated to the hosting of your Cloud services.
A laboratory and its services are secured by user authentication (using X.509 certificates) and VPN access.
The following sections will guide you throught these configuration steps.

Prerequisites
-------------

- You received an e-mail with subject "Developer Cloud Sandboxes service  -  Invitation to register",
- You filled a registration form, following the instructions in the invitation e-mail,
- Your registration was approved, and you received an e-mail from ca@terradue.com with subject "Your Terradue certificate is ready to download".

Download your Certificate in PFX format
--------------------------------------

The Secure Socket Layer (SSL) is the most widely deployed security protocol used today. It is essentially a protocol that provides a secure channel between two machines operating over the Internet or an internal network.
The SSL Certificate issued by the Terradue Certification Authority (CA) is used to access securely the Terradue's infrastructure. It should be imported into a browser in order to use it. This section describes the certificate import procedures for different browsers and platforms.

- Go to *https://ca.terradue.com/gpodcs/cgi/certdown.cgi?U=<your_registration_email@organization.com>&F=Kpfx* (**replace by your registration e-mail**)
- Type the certificate password that you chose during the registration.

Import your Certificate in a Browser
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


Install your OpenVPN Client
---------------------------

Now you can download and install your OpenVPN Client, in order to establish a connection with Terradue's VPN server.

Prerequisites:
- You received an e-mail with subject "Certificate download and VPN Setup procedure".

*IMPORTANT NOTICE*: if you have a previously installed VPN client (e.g. Tunnelblick) on your system, such **previously installed client must be disconnected and then be disabled** (we recommend uninstalling it).

- Go to https://access.terradue.com ,
- Type as Username the email used during the registration,
- Type as Password the passphrase that you chose during the registration,
- Once logged, all the connection setup is automatic, you must only approve the access by the new client.

Run your VPN Connection
-----------------------

- In your desktop tray, click on the "OpenVPN Connect" icon,
- From the dropdown menu, select the entry "Connect to access.terradue.com",
- Provide your username and password to approve the access, if required,
- Check that the "OpenVPN Connect" icon in your desktop tray is now featuring a green symbol,
- That's all :-)


Known caveats
-------------

When the OpenVPN client is installed on a Linux/Unix OS, the OpenVPN Server is unable to alter the DNS settings on the client in question. A typical behaviour in these cases is that you are able to ping your Sandbox through the IPv4 but not through the hostname. To solve this kind of issues it is enough to add manually the Terradue's DNS to your */etc/resolv.conf* file the line:

.. code-block:: bash

  nameserver 10.10.10.1

If you are using the NetworkManager (e.g. in the GNOME desktop environment), you should instead statically add the nameserver address 10.10.10.1 through the GUI. 

Safari
^^^^^^

- Double-click the downloaded certificate file to launch the Keychain Access application,

- Enter your certificate passphrase when prompted.


Going further
-------------

How to use the OpenVPN Command Line Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If the system you are using has not a Graphical User Interface for OpenVPN, you have to use the OpenVPN's command line. 
Also, in some scenarios you need to use the OpenVPN's command line interface, for example in a script to automatically start the VPN connection. 
It can also be useful when you want to automatically start the VPN from a startup script.

So you can execute the OpenVPN client through the "openvpn" command by using the prompt (Unix Shell or Windows Prompt). 

The CLI parameters are listed and described in the manual page of OpenVPN.
You can check them by typing the command:

.. code-block:: bash

  man openvpn

from a Unix shell, the OpenVPN's manual page will be displayed. 
A great number of parameters are available to directly use in the command line prefixed by two consecutive hyphens (--). 
The same parameters (not prefixed by --) can also be specified in the configuration file.

.. NOTE::
  Except for a few cases, it is better to specify the parameters in a configuration file rather than having them in a too long and heavy to read command line.


How to manualy setup OpenVPN on other Platforms
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To download the "OpenVPN Connect" client for installation on another computer, you can access installation material and configuration templates from here https://access.terradue.com/?src=connect
You can establish a VPN connexion with Terradue's OpenVPN server by using the command line.

- Go to https://access.terradue.com/?src=login,
- Type as Username the email used during the registration,
- Type as Password the passphrase that you chose during the registration,
- Download the client.ovpn configuration file from the link "Yourself (user-locked profile)",
- Download the cacert.pem from https://ca.terradue.com/gpodcs/certs/cacert.pem
- Put the files client.ovpn and cacert.pem in a same directory (suppose /etc/openvpn/). 
- Change the current directory to /etc/openvpn/ and exec (with root privileges) the command:

.. code-block:: bash

  openvpn --config client.ovpn

- You are requested for the Username and the Password,
- If the client is authenticated against the server, the VPN connection is established.


How to build and install OpenVPN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For the most operating system in which OpenVPN works, binary packages already compiled exist. 
Anyway, sometimes, above all for some Linux Distributions, you could need to build OpenVPN by starting with the source code.

- Download the OpenVPN's source code from the site http://openvpn.net. Pick the latest stable release that is available (*suppose the release 2.0.9 in the rest of this document*);
- Extract the files which are stored in the zipped archive that you have downloaded by using the tar command in the following manner:

.. code-block:: bash

    tar xvfz openvpn-2.0.9.tar.gz

- Change the current directory to openvpn-2.0.9 with the command:

.. code-block:: bash

        cd openvpn-2.0.9

- Check the system and produce the Makefiles by using the following command:

.. code-block:: bash

        ./configure --prefix=/usr
        make
        make install

If the ./configure procedure claims that the lzo libraries and headers are not found in the system, install the lzo compression software as follows below:

- Download the source package of LZO from the site http://www.oberhumer.com/ and extract its content with the command:

.. code-block:: bash

        tar xvfz lzo-2.02.tar.gz

- Change the current directory to lzo-2.02 and install the LZO software with the commands:

.. code-block:: bash

        ./configure --prefix=/usr
        make
        make install
        
.. WARNING::
  Because the files will be written below the system directory /usr, the *make install* command must be executed with root privileges.
