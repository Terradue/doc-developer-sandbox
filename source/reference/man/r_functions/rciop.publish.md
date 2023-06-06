# rciop.publish \{rciop}

## Description

Publishes results to the distributed file system, or publishes the results location, or echoes strings as inputs to the subsequent nodes in the workflow.

## Usage

```bash
rciop.publish (path="./", recursive=FALSE, metalink=FALSE, mode="", driver="")
```

## Arguments

`path`

: the path to the result of folder to publish

`recursive`

: if set to TRUE will traverse the folder tree and publish all files

`metalink`

: if set to TRUE the published results will be an item in the results' metalink

`mode`

: if mode is set to "silent", rciop.publish will echo the content of `path` as inputs to the subsequent nodes in the workflow
  this mode overrides the `recursive`, `metalink` and `driver` options

`driver`

: \[DEPRECATED\]

## Details

This function stages-out local files to the distributed filesystem or will define the inputs to be passed to the next nodes in the workflow.

## Value

List with:

- exit.code: 0 if succesful, >0 if unsuccessful
- output: path of the published product

## Examples

```bash
res <- rciop.publish(paste(TMPDIR,"output", sep="/"), TRUE, FALSE)
if (res$exit.code==0) { published <- res$output }
```

```bash
for(i in 1:nrow(selected)) {
  selected[i, "Rdf1"] <- subset(trace, trace$V1==selected[i, "Prm1"])$x
  selected[i, "Rdf2"] <- subset(trace, trace$V1==selected[i, "Prm2"])$x
  rciop.publish(as.character(paste(selected[i, c("Rdf1", "Rdf2")], collapse=",")), mode="silent")
}
```

## Author

Terradue
