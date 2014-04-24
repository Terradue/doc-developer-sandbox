.. _openvpncli:

OpenVPN Command line
--------------------

If the system you are using has not a Graphical User Interface for OpenVPN, you have to use the OpenVPN's command line. 
This can also be used in the case in which you want to automatically start the VPN by using the startup scripts.

By typing the command:

.. code-block:: bash

  man openvpn

from a Unix shell, the OpenVPN's manual page will be displayed. A great number of parameters are available to directly use in the command line prefixed by two consecutive hyphens (--). The same parameters (not prefixed by --) can also be specified in the configuration file.

.. NOTE::
  Except for a few cases, it is better to specify the parameters in a configuration file rather than having them in a too long and heavy to read command line.

Establish a VPN Connection
^^^^^^^^^^^^^^^^^^^^^^^^^^

This section does not examine the parameters because they are already listed and described in the manual page of OpenVPN, but it only describe how to establish a VPN with a Terradue's OpenVPN server by using the command line.

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

Build and install OpenVPN
-------------------------

For the most operating system in which OpenVPN works, binary packages already compiled exist. Anyway, sometimes, above all for some Linux Distributions, you could need to build OpenVPN by starting with the source code.

How to build OpenVPN
^^^^^^^^^^^^^^^^^^^^

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
