(catalogue)=

# Hands-On Exercise 9: using an OpenSearch catalogue

In this exercise we will use an OpenSearch [^f1] catalogue URL as the input source of the workflow,
and query the catalogue with OpenSearch parameters to get the input products.

## Prerequisites

- You have cloned the Hands-On git repository (see {ref}`hands-on-repo`),
- *(Only for python)* You have installed the required software (see {ref}`python-reqs`).

## Install the Hands-On

- Install the Hands-On Exercise 9, just type:

```console
cd
cd dcs-hands-on
mvn clean install -D hands.on=9 -P bash
```

## Inspect the application.xml

- Inspect the *application.xml*, it is slightly different than the one of the previous exercise {doc}`a multi-node workflow <multinode>`:

:::{container} context-application-descriptor-file
```{literalinclude} src/dcs-hands-on/src/main/app-resources/hands-on-9/application.xml
:language: xml
:tab-width: 2
```
:::

Note the different **source** in the *node_expression*:

:::{container} context-application-descriptor-file
```{literalinclude} src/dcs-hands-on/src/main/app-resources/hands-on-9/application.xml
:language: xml
:lines: 54-62
:tab-width: 2
```
:::

Note also the **OpenSearch parameters** defined in the jobTemplate *expression*:

:::{container} context-application-descriptor-file
```{literalinclude} src/dcs-hands-on/src/main/app-resources/hands-on-9/application.xml
:language: xml
:lines: 5-13
:tab-width: 2
```
:::

## Run and debug the workflow

- Run the *node_expression*:

```console
ciop-run node_expression
```

- Copy the Tracking URL and paste it in a browser,
- Check the log of one of the two Tasks, as described in {doc}`make a robust workflow and debug it <debug>`. It will be similar to:

:::{figure} includes/catalogue/gui1.png
:alt: Task output
:scale: 60 %
:::

Note that the input product is now downloaded from an external repository, resulting from the initial OpenSearch query to the catalogue, and from the way that catalogue references datasets.

## Recap

1. We used an OpenSearch catalogue as the source of the first node of the workflow;
2. We defined a number of OpenSearch parameters to query the catalogue;
3. We processed the query results in the *node_expression*.

```{rubric} Footnotes
```

[^f1]: [OpenSearch](http://www.opensearch.org/)
