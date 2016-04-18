.. _sandbox:

Connect to your Sandbox
========================

To connect your Sandbox you need a secure connection with the Terradue's infrastructure. Following this guide you will be able to access your Sandbox through the Secure Shell (SSH) network protocol.

Prerequisites
-------------

- You receveid an email from support@terradue.com where the subject contains "Cloud Dashboard access and Sandbox deployment" and obtained information on how to get the <cloud_username> and the <sandbox_host> values,
- You are connected to the Terradue's VPN (see :ref:`run-your-vpn-connection`),
- You installed your SSH key (see :ref:`install-ssh-key`),

.. _connecting_from_unix_linux_mac:

Connecting from Unix / Linux / Mac
----------------------------------

- Open a Terminal,

- Type:

.. code-block:: bash

  ssh <cloud_username>@<sandbox host>

That's all :-)

.. _connecting_from_windows:

Connecting from Windows
------------------------

- Open a Command Prompt,

- Change directory to the putty unzipped folder:

.. code-block:: bash
  
  cd \path\to\your\putty\folder
  
- Type:

.. code-block:: bash

  PUTTY.EXE -i id_rsa.ppk <cloud_username>@<sandbox_host>

That's all :-)