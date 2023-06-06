(sandbox)=

# Connect to your Sandbox

To connect with your Sandbox, you need a secure connection to our infrastructure. Following this guide you will be able to access your Sandbox through the Secure Shell (SSH) network protocol.

## Prerequisites

- You received an email from <mailto:support@terradue.com> with the subject "Cloud Dashboard access and Sandbox deployment" and obtained information on how to get the VM \<cloud_username> and \<sandbox_host> values,
- You are connected to our VPN (see {ref}`run-your-vpn-connection`),
- You installed your SSH keys (see {ref}`install-ssh-key`).

(connecting-from-unix-linux-mac)=

## Connecting from Unix / Linux / Mac

- Open a Terminal,
- Type:

```bash
ssh <cloud_username>@<sandbox host>
```

That's all :-)

(connecting-from-windows)=

## Connecting from Windows

- Open a Command Prompt,
- Change directory to the putty unzipped folder:

```bash
cd \path\to\your\putty\folder
```

- Type:

```bash
PUTTY.EXE -i id_rsa.ppk <cloud_username>@<sandbox_host>
```

That's all :-)
