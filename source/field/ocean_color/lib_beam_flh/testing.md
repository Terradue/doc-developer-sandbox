# Application testing

## Application installation

First configure your Sandbox to use Java 7:

```bash
sudo yum install -y java-1.7.0-openjdk
```

Select Java 7

```bash
sudo /usr/sbin/alternatives --config java
```

This will show on the terminal window:

```bash
There are 3 programs which provide 'java'.

  Selection    Command
-----------------------------------------------
 + 1           /usr/java/jdk1.6.0_35/jre/bin/java
   2           /usr/lib/jvm/jre-1.5.0-gcj/bin/java
*  3           /usr/lib/jvm/jre-1.7.0-openjdk.x86_64/bin/java

Enter to keep the current selection[+], or type selection number:
```

Select java 1.7 out of the menu options by typing the correct number (here it's *3*).

All the application resources are available on the GitHub repository: <https://github.com/Terradue/dcs-beam-flh-java>

To install the application clone the repository on the sandbox in your home folder:

```bash
cd ~
git clone https://github.com/Terradue/dcs-beam-flh-java.git
cd dcs-beam-flh-java
```

Update the Application descriptor file to use the Sandbox catalogue with the data you've copied:

```bash
vi src/main/app-resources/application.xml
```

And change the source from:

```xml
<sources>
  <source refid="cas:series">http://catalogue.terradue.int/catalogue/search/MER_RR__1P/description</source>
</sources>
```

To:

```xml
<sources>
  <source refid="cas:series">http://localhost/catalogue/sandbox/MER_RR__1P/description</source>
</sources>
```

Then build the BEAM FLH Java processor and the application resources with:

```bash
mvn install
```

The maven command will:

- Copy the application resources files from ~/dcs-beam-flh-java/src/main/app-resources to /application
- Retrieve from BEAM website all the Java artifacts required to run BEAM
- Compile the FLH Operator Java files and resources and place the compiled libraries in the correct location

## Application check

The Application Descriptor file can be checked against the schema with:

```bash
ciop-appcheck
```

If the Application Descriptor is valid, the output is:

```bash
/application/application.xml validates
```

## Installing the required packages

The application requires ESA BEAM Toolbox to compile and run.

All dependencies are listed in the pom.xml and downloaded during the mvn install execution.

## Simulating the application execution

There are two approaches to test an application:

- The first manually invokes each of the nodes,
- The second triggers the automatic execution of the workflow.

Both approaches use the command line utility ciop-run [^f1].

### Testing a single node of the workflow

List the nodes of a workflow:

```bash
ciop-run -n
```

This command returns:

```bash
node_flh
```

Trigger the execution of the node_flh with:

```bash
ciop-run node_flh
```

The node_flh will produce one tiff image file per input Envisat MERIS Level 1 product.

These files are all available in the Sandbox Hadoop distributed filesystem. See {doc}`Hands-on Exercise 8 - browse published results <../../../developer/browseresults>` on how to access the HDFS filesystem through the Web interface.

### Testing the entire workflow execution

```bash
ciop-run
```

Wait for the workflow execution.

```{rubric} Footnotes
```

[^f1]: {doc}`ciop-run man page </reference/man/bash_commands_functions/simulation/ciop-run>`
