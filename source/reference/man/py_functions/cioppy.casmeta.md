# ciop.casmeta

## Description

Returns the metadata value of the given field for a given product catalogue RDF URL

## Usage

```python
import cioppy
ciop = cioppy.Cioppy()

ciop.casmeta (field, url)
```

## Arguments

`field`

: name of the metadata field

`url`

: the URL to the OpenSearch catalogue entry in RDF format

## Details

This function returns the value of the metadata field associated to an OpenSearch product URL in RDF format

## Value

List with:

- exit.code: 0 if succesful, >0 if unsuccessful
- output: metadata field value

## Examples

```python
direction = ciop.casmeta("eop:orbitDirection", input)
```

## Author

Terradue
