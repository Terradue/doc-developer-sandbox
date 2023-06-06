# Getting started with Cioppy

## Installation procedure

Hereafter, you will find the basic steps needed to install anaconda (esp. the Conda package manager tool for Python) and cioppy:

To install anaconda:

```console
sudo yum install -y miniconda
```

To see the python version:

```console
export PATH=/opt/anaconda/bin/:$PATH
python -V
Python 2.7.9 :: Continuum Analytics, Inc.
```

To install cioppy:

```console
sudo conda install cioppy
```

To search for a Python package:

```console
sudo conda search <package>
```

To install a Python package

```console
sudo conda install <package>
```

## Usage

To use the Anaconda's version of Python, use the following shebang in your Python scripts:

```python
#!/opt/anaconda/bin/python
```

## Example

```python
#!/opt/anaconda/bin/python

import cioppy
ciop = cioppy.Cioppy()
```

:::{NOTE}
We are working on enabling the usage of the classical #!/usr/bin/env Python shebang.
:::
