(basic)=

# Hands-On Exercise 1: a basic workflow

In this exercise we will prepare a simple workflow, and we will execute a first run using the [CIOP](http://docs.terradue.com/developer-sandbox/reference/man/bash_commands_functions/index.html) tools.

## Prerequisites

- You have cloned the Hands-On git repository (see {ref}`hands-on-repo`),
- *(Only for python)* You have installed the required software (see {ref}`python-reqs`).

## Install the Hands-On

The Hands-On installation is quite straightforward, and it is performed with the [Maven](http://maven.apache.org/) tool:

```console
cd
cd dcs-hands-on
mvn clean install -D hands.on=1 -P bash
```

With the last command you installed the first Hands-On exercise (option *-D*) using a *bash* profile (option *-P*). The profile represents the programming language used to implement the Hands-On run executables.

## Understand the workflow

A workflow must be defined as a DAG [^f1]. There is a special file, named *application.xml*, that defines a workflow. The first step is to create an *application.xml*:

- Go to the application's default location (/application), by typing:

```console
cd $_CIOP_APPLICATION_PATH
```

- Check for a file named *application.xml*
- Open it with a text editor (e.g. vi) and inspect its content. It will be similar to:

:::{container} context-application-descriptor-file
```{literalinclude} src/dcs-hands-on/src/main/app-resources/hands-on-1/application.xml
:language: xml
:tab-width: 2
```
:::

## Check the inputs

- Check for a file named *list* under the folder *inputs*:

```console
cat inputs/list
```

- It will be similar to:

```{literalinclude} src/dcs-hands-on/src/main/app-resources/hands-on-1/inputs/list
:language: none
```

:::{WARNING}
Such a file should not contain blank lines at the beginning or at the end, and comments are not allowed.
:::

## Check the run executable

A run executable is responsible for the *execution* of your application (or a step of it) by the Hadoop compute engine. In the *application.xml* we defined a workflow with a single node and the related run executable:

:::{container} context-application-descriptor-file
```{literalinclude} src/dcs-hands-on/src/main/app-resources/hands-on-1/application.xml
:language: xml
:lines: 5-5
:tab-width: 2
```
:::

- Inspect the *run* executable:

```console
cat my_node/run
```

:::{admonition} Note
Depending from the profile chosen (maven's option *-P*), a run executable can be written in different programming or scripting languages including python, R, or bash (the Hands-On exercises are initially available in python and bash).
:::

## Run the node

- List the available node(s) with:

```console
ciop-run -n
```

This returns:

```console-output
my_node
```

- Execute it by typing:

```console
ciop-run my_node
```

The output will be similar to:

```console-output
2016-01-19 12:27:48 [WARN ] -  -- WPS needs at least one input value from your application.xml (source or parameter with scope=runtime);
2016-01-19 12:27:51 [INFO ] - Workflow submitted
2016-01-19 12:27:51 [INFO ] - Closing this program will not stop the job.
2016-01-19 12:27:51 [INFO ] - To kill this job type:
2016-01-19 12:27:51 [INFO ] - ciop-stop 0000000-160119102214227-oozie-oozi-W
2016-01-19 12:27:51 [INFO ] - Tracking URL:
2016-01-19 12:27:51 [INFO ] - http://sb-10-16-10-50.dev.terradue.int:11000/oozie/?job=0000000-160119102214227-oozie-oozi-W

Node Name     :  my_node
Status        :  OK

Publishing results...

2016-01-19 12:28:31 [INFO ] - Workflow completed.
```

:::{admonition} Note
Since the Hadoop Sandbox mode that is used here runs on a Virtual Machine offering two Cores, and the node 'my_node' has to process only two inputs, the input1 and input2 lines have been processed in parallel, by two simultaneous tasks (each task processing a single entry of the input file).
From there, Hadoop deployments in Cluster mode will handle the scaling up of your application to a larger amount of data input and processing nodes.
:::

## Recap

1. We installed a simple workflow with a single node;
2. We passed to the workflow a list of two data inputs;
3. We executed a simple run that logs the name of data inputs, running two tasks in parallel.

```{rubric} Footnotes
```

[^f1]: [Directed acyclic graph](http://en.wikipedia.org/wiki/Directed_acyclic_graph)
