(browseresults)=

# Hands-On Exercise 8: browse published results

In this exercise, we will run again the workflow of the exercise {doc}`a multi-node workflow <multinode>`,
then we will browse its results through the Oozie Web Console that was previously introduced.

## Prerequisites

- You have cloned the Hands-On git repository (see {ref}`hands-on-repo`),
- *(Only for python)* You have installed the required software (see {ref}`python-reqs`).

## Install the Hands-On

- Install the Hands-On Exercise 8, just type:

```console
cd
cd dcs-hands-on
mvn clean install -D hands.on=8 -P bash
```

## Run the workflow

- Type the following command:

```console
ciop-run
```

- Wait until the workflow is completed (it will take approximately five minutes).

## Browse the results

- Open a browser and type <http://$HOSTNAME:50070> ,

:::{tip}
Read how to obtain the value of your Sandbox \$HOSTNAME in the {doc}`General Notes <general_notes>` section
:::

- Click on the link *Browse the filesystem*,
- Click on the link *ciop*,
- Click on the link *run*,
- Click on the link *hands-on-8*,
- Click on the link representing the workflow id (e.g., *0000269-150209145053100-oozie-oozi-W*),
- Click on the link *\_result*,
- To see intermediate results, click on *node_expression* and then click on *data*.

The following images show the steps that we have just performed:

:::{figure} includes/browseresults/gui1.png
:alt: Browse results
:scale: 80 %
:::

:::{figure} includes/browseresults/gui2.png
:alt: Browse results
:scale: 80 %
:::

:::{figure} includes/browseresults/gui3.png
:alt: Browse results
:scale: 80 %
:::

:::{figure} includes/browseresults/gui4.png
:alt: Browse results
:scale: 80 %
:::

:::{figure} includes/browseresults/gui5.png
:alt: Browse results
:scale: 80 %
:::

:::{figure} includes/browseresults/gui6.png
:alt: Browse results
:scale: 80 %
:::

:::{figure} includes/browseresults/gui7.png
:alt: Browse results
:scale: 80 %
:::

## Recap

1. We executed a multinode workflow;
2. We browsed either final or intermediate results through the Oozie Web Console.
