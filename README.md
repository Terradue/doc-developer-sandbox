# Developer Cloud Sandbox Documentation

This is the official repository of the Developer Cloud Sandbox. 

This documentation is live at:
[http://docs.terradue.com/developer-sandbox](http://docs.terradue.com/developer-sandbox).

You are encouraged to fork this repo and send us pull requests!

## Getting started

Here's the procedure to install the required packages on a CentOS 6.x

```
# Install RHEL EPEL repository
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm

# Install sphinx
sudo yum install python-sphinx10
sudo yum install python-pip
sudo pip install sphinx_bootstrap_theme

# Clone the git repository
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
ln -s $GIT_CLONE_DIR/doc-developer-sandbox/build/html/ developer-sandbox
chown -R apache:apache developer-sandbox
chmod -R g+w developer-sandbox
```
> Replace $GIT_CLONE_DIR with the path to the folder where you have cloned the repository

Open you browser at the address http://127.0.0.1/developer-sandbox

## This documentation is built with sphinx-doc

[More information](http://sphinx-doc.org/).
