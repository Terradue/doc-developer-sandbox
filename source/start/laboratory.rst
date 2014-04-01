Laboratory
==========

Import Certificate in web browser
+++++++++++++++++++++++++++++++++

To import the .P12 certificate:

1) View your installed certificate:

In Firefox v2 (Linux): Click Edit -> Preferences, click Advanced, click the Encryption tab, and then click View Certificates.
In Firefox v2 (Windows): Click Tools -> Options, click Advanced, click Encryption, and then click View Certificates.
In Firefox v1.5 (Linux): Click Edit -> Preferences, click Advanced, click Security, and then click View Certificates.
In Firefox v1.5 (Windows): Click Tools -> Options, click Advanced, click Security, and then click View Certificates.
In Mozilla v1.7 or Seamonkey v1 (Linux): Click Edit -> Preferences, expand Privacy & Security, click Certificates, and then click Manage Certificates.
In Internet Explorer v7: Click Tools -> Internet Options, click the Content tab, and under Certificates, click the Certificates button.
In Internet Explorer v6: Click Tools -> Internet Options, click the Content tab, and under Certificates, click Personal.

2) Click Import, browse to your local .P12 or .PFX certificate file, and enter your certificate pass phrase when prompted.

VPN Setup
+++++++++

Introduction

The purpose of this section is to lead the users to install and use their OpenVPN Client, in order to establish connection with Terradue's VPN server.

Since August 2013, a new way to establish your virtual private network is in place.
We expect it to be more easy and intuitive.

IMPORTANT NOTICE: if you have a previously installed VPN client (e.g. tunnelblick) on your system, such previously installed client must be disconnected and then be disabled (we recommend uninstalling it).

Automated setup

From now on, you can directly go to:
https://access.terradue.com
and login using your username and password.

Once logged, all the connection setup is automatic, you must only approve the access by the new client.

Running your VPN connection

    In your desktop tray, click on the "OpenVPN Connect" icon
    From the dropdown menu, select the entry "Connect to access.terradue.com"
    Provide your username and password to approve the access

You are now connected !
Check that the "OpenVPN Connect" icon in your desktop tray is now featuring a green symbol.

Once connected to the VPN, the procedure for accessing your Sandbox is unchanged, and still makes use of your private keys with SSH access (cf. SSH Connexion).

Nota bene

Manual setup on other platforms

To download the "OpenVPN Connect" client for installation on another computer, you can access installation material and configuration templates from here:
https://access.terradue.com/?src=connect

Command Line Interface

Some users need to use the OpenVPN's command line interface.

This last possibility is useful, because the "openvpn" command, which you can execute by using the prompt (Unix Shell or Windows Prompt) accepts the same parameters and has the same behavior regardless of which Operating System you use.

In addition, you can use the "openvpn" command in a script to automatically start the VPN connection.
The OpenVPN Command line section describes how to build and install OpenVPN for most of the operating systems, and use it via command lines.
