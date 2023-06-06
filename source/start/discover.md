(discover)=

# Discover the Sandbox services & tools

## User dashboard Web UI

Accessed from the VPN at the address: <http:/>/\<your_sandbox_host>/dashboard

The Dashboard provides:

**Sandbox tab**

:::{figure} assets/dashboard_sandbox.png
:align: center
:alt: alternate text
:figclass: align-center
:width: 500px

The Sandbox status information (name, owner, security, network, disks)
:::

**Application descriptor viewer tab**

:::{figure} assets/dashboard_application.png
:align: center
:alt: alternate text
:figclass: align-center
:width: 500px

A viewer for the Application Descriptor XML file
:::

**Debug tab**

:::{figure} assets/dashboard_debug.png
:align: center
:alt: alternate text
:figclass: align-center
:width: 500px

A debug tab presenting the workflows launched with the command ciop-run or submitted using the WPS interface, as managed by Hadoop Oozie
:::

**Invoke tab**

:::{figure} assets/dashboard_invoke.png
:align: center
:alt: alternate text
:figclass: align-center
:width: 500px

A processing invocation client, interacting with Hadoop via a Web Processing Service (WPS) interface
:::

**Health tab**

:::{figure} assets/dashboard_health.png
:align: center
:alt: alternate text
:figclass: align-center
:width: 500px

A Cloud Service health monitoring (CPU consumption, Disk usage, Cluster status)
:::

**Help tab**

:::{figure} assets/dashboard_help.png
:align: center
:alt: alternate text
:figclass: align-center
:width: 500px

A Ticketing system client to interact with the Platform Support team
:::

## Oozie Web GUI

To view processes launched with the ciop-run command you can use the Oozie GUI Web Console.

:::{figure} assets/oozie_console.png
:align: center
:alt: alternate text
:figclass: align-center
:width: 500px

Accessed from the VPN at the address: <http:/>/\<your_sandbox_host>:11000
:::

## The ciop tools

The CIOP tools are part of your PaaS development environment.
They form a set of API to manage the data flows (stage-in/out) and are accessed from within the Streaming executable scripts declared in your job templates.

Check the {doc}`Reference Guide <../reference/index>` for a detailed information about the tools.
