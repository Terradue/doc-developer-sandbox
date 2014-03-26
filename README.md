# Developer Cloud Sandbox Documentation

This is the official repository of the Developer Cloud Sandbox. 

This documentation is live at:
[http://docs.terradue.com/developer-sandbox](http://docs.terradue.com/data-challenges).

You are encouraged to fork this repo and send us pull requests!

## Getting started

Here's the procedure to install the required packages on a CentOS 6.x

```
sudo yum install python-sphinx
sudo yum install python-pip
pip install sphinx_bootstrap_theme
git clone git@github.com:Terradue/doc-developer-sandbox.git
```

If needed, set your github information

```
git config --global user.name <github username>
git config --global user.email <email address>
```

## Building

Build the documentation by running ``make html``.

## Publish the documentation

``make html`` creates a ``build`` folder in the doc-developer-sandbox local repository.

As root, do:

```
cd /var/www/html
ln -s /home/fbrito/doc-developer-sandbox/build/html/ developer-sandbox
chown apache:ciop developer-sandbox
chmod -R g+w developer-sandbox
```
> Replace /home/fbrito with the path to the folder where you have cloned the repository

Open you browser at the address http://127.0.0.1/developer-sandbox

## This documentation is built with sphinx-doc

[More information](http://sphinx-doc.org/).
