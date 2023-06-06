# ciop.getparam

## Description

Returns the value of the parameter as a characters string

## Usage

```python
import cioppy
ciop = cioppy.Cioppy()

ciop.getparam (param)
```

## Arguments

`param`

: the name of the parameter

## Details

Returns the value defined at the job template level for a given parameter name (to retrieve its default value), or defined at the workflow level (to override the default value of the jobtemplate). If defined, the workflow value has priority over the job template value.

## Value

Value of the parameter as a characters string

## Examples

```python
myvar = ciop.getparam('param1')
```

## Author

Terradue
