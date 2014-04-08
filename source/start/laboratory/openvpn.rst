Setup the VPN Connection
========================

The purpose of this section is to lead the users to install and use their OpenVPN Client, in order to establish connection with Terradue's VPN server.

Prerequisites
-------------

- You received an e-mail with subject "Certificate download and VPN Setup procedure".

Install the OpenVPN Client
--------------------------

*IMPORTANT NOTICE*: if you have a previously installed VPN client (e.g. Tunnelblick) on your system, such **previously installed client must be disconnected and then be disabled** (we recommend uninstalling it).

- Go to https://access.terradue.com ,
- Type as Username the email used during the registration,
- Type as Password the passphrase that you chose during the registration,
- Once logged, all the connection setup is automatic, you must only approve the access by the new client.

Running the VPN Connection
--------------------------

- In your desktop tray, click on the "OpenVPN Connect" icon,
- From the dropdown menu, select the entry "Connect to access.terradue.com",
- Provide your username and password to approve the access, if required,
- Check that the "OpenVPN Connect" icon in your desktop tray is now featuring a green symbol,
- That's all :-)

Manual setup on other Platforms
-------------------------------

To download the "OpenVPN Connect" client for installation on another computer, you can access installation material and configuration templates from here https://access.terradue.com/?src=connect

Command Line Interface
---------------------

In some scenarios you need to use the OpenVPN's command line interface, for example in a script to automatically start the VPN connection. So you can execute the OpenVPN client through the "openvpn" command  by using the prompt (Unix Shell or Windows Prompt). 
The section :doc:`OpenVPN Command Line <openvpncli>` will help you how to build and install OpenVPN for most of the operating systems, and use it via the command line.

Caveats
-------

When the OpenVPN client is installed on a Linux/Unix OS, the OpenVPN Server is unable to alter the DNS settings on the client in question. A typical behaviour in these cases is that you are able to ping your Sandbox through the IPv4 but not through the hostname. To solve this kind of issues it is enough to add manually the Terradue's DNS to your */etc/resolv.conf* file the line:

        `nameserver 10.10.10.1`

If you are using the NetworkManager (e.g. in the GNOME desktop environment), you should instead statically add the nameserver address 10.10.10.1 through the GUI. 
