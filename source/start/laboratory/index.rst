.. _laboratory:

Join your Laboratory
####################

A Laboratory is a virtual network on Terradue Cloud Platform, dedicated to the hosting of your Cloud services.
A laboratory and its services are secured by user authentication and VPN access.
The following sections will guide you through the procedure related to user SSH key pair management and VPN setup.

.. _laboratory-prerequisites:

Prerequisites
-------------

- You registered on Terradue's Portal
- You received an e-mail with subject "SSH key pair and VPN Setup procedure | Join your Laboratory !".

.. _install-ssh-key:

Generate and install the SSH key pair
------------------------------------

SSH key pair is a way to identify trusted computers without involving passwords. You can generate a SSH key pair and add the public key to your account on Terradue Cloud Platform by following the procedures below.

Generate a new SSH key pair
^^^^^^^^^^^^^^^^^^^^^^^^^

* Go to https://www.terradue.com,
* Click on the top-right button *Sign-in*,
* Type your login credentials,
* Click on the top-right button showing your username,
* Click on **Profile**,
* In the *Personal settings* left panel, click on **SSH keys**,
* Click on **Generate a new SSH key pair**,
* Type your password when requested,
* Download the *Private SSH key*.

Install the generated SSH key pair
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Linux/Unix/Mac users
********************

Store your SSH key pair into the .ssh directory in your HOME directory:

.. code-block:: bash

  cd <your/download/directory>
  chmod 400 id_rsa
  cp id_rsa $HOME/.ssh/


Windows users
**************

Download and install PuTTY
++++++++++++++++++++++++++

PuTTY is a well-known freely available SSH client http://www.putty.org/. To download and install it:

* Go to http://the.earth.li/~sgtatham/putty/latest/x86/putty.zip,
* Unzip the downloaded file in a location of your filesystem that you prefer.

Generate a Private PuTTY key from the Private SSH key
+++++++++++++++++++++++++++++++++++++++++++++++

* Go to the unzipped putty folder,
* Double-click on the *PUTTYGEN.EXE* executable,
* Click on the *Import key* command from the *Conversions* menu,
* Select the id_rsa file,
* Click on the *Save private key* button,
* Store the private key generated in the unzipped putty folder, naming it in *id_rsa.ppk*.

Install your OpenVPN Client
---------------------------

Now you can download and install your OpenVPN Client, in order to establish a connection with Terradue's VPN server.

.. important::

  if you have a previously installed VPN client (e.g. Tunnelblick) on your system, such **previously installed client must be disconnected and then be disabled** (we recommend uninstalling it).

- Go to https://access.terradue.com
- Type as Username the email used during your registration.
- Type as Password the passphrase that you chose during the registration.
- Once logged, all the connection setup is automatic, you must only approve the access by the new client.

.. _run-your-vpn-connection:

Run your VPN Connection
-----------------------

- In your desktop tray, click on the "OpenVPN Connect" icon.
- From the dropdown menu, select the entry "Connect to access.terradue.com".
- Provide your username and password to approve the access, if required.
- Check that the "OpenVPN Connect" icon in your desktop tray is now featuring a green symbol.
- That's all :-)


.. admonition:: Congrats

  You have now completed your setup for accessing your laboratory on Terradue's Cloud Platform. 
  You shall be able to access your user dashboard here: http://<sandbox_host>/dashboard. 
  **So, let's try a first** :doc:`Connect to your Sandbox <../sandbox>` **now !**


Known caveats
-------------

DNS issues
^^^^^^^^^^^

When the OpenVPN client is installed on a Linux/Unix OS, the OpenVPN Server is unable to alter the DNS settings on the client in question. 
A typical behaviour in such cases is that you are able to ping your Sandbox through its IPv4 address, but not through the hostname. 
To solve this kind of issue, add manually Terradue's DNS server as a new line in your */etc/resolv.conf* file:

.. code-block:: bash

  nameserver 10.16.20.14

If you are using the NetworkManager tool (e.g. in the GNOME desktop environment), you should instead statically add the nameserver address 10.16.20.14 through the GUI.

HTTP proxy server
^^^^^^^^^^^^^^^^^

When the *OpenVPN Connect* client is installed behind a corporate HTTP proxy server, the connection fails because the proxy server doesn't allow the VPN traffic. Thus the *OpenVPN Connect* client is not able to automatically download the *.ovpn* configuration file.

Hereafter a procedure to configure your VPN connection in that situation:

* Remove any previous version of the *OpenVPN Connect* client,

* Download and install the latest OpenVPN client from https://openvpn.net/index.php/open-source/downloads.html,

* Go to https://access.terradue.com/?src=login,

* Type as Username the email used during the registration,

* Type as Password the passphrase that you chose during the registration,

* Download the *client.ovpn* configuration file from the link *"Yourself (user-locked profile)"*,

* Modify the *client.ovpn* as described below:

* Substitute:

.. code-block:: bash

  remote access.terradue.com 443 udp
  remote access.terradue.com 443 udp
  remote access.terradue.com 443 tcp
  remote access.terradue.com 443 udp
  remote access.terradue.com 443 udp
  remote access.terradue.com 443 udp
  remote access.terradue.com 443 udp
  remote access.terradue.com 443 udp

With:

.. code-block:: bash

  remote access.terradue.com 443 tcp
  http-proxy <proxy_address> <proxy_port>
  http-proxy-retry
  
Check with your Network Administrator the values of *<proxy_address>* *<proxy_port>*.

* Put the *client.ovpn* configuration file under *<installation-dir>/config*,

* Start the OpenVPN connection.

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


How to manually setup OpenVPN on other Platforms
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To download the "OpenVPN Connect" client for installation on another computer, you can access installation material and configuration templates from here:

https://access.terradue.com/?src=connect

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
