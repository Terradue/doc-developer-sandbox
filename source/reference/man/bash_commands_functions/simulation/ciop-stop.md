# ciop-stop

## Synopsis

**ciop-stop** \[options\] \[job_ID\]

## Description

`ciop-stop` kills the most recent RUNNING worflow. If job_ID is provided, the RUNNING workflow corresponding at the specified job_ID is killed.

## Options

`-l`

: Provides the job IDs of all the RUNNING workflows

`-a`

: Kill all the RUNNING workflows

## Exit Status

`ciop-stop` command exits with

- 0           Job killed successfully or no RUNNING Job found
- 255         invalid options are provided
- any other exit code is from the executable itself

## Examples

```bash
ciop-stop -a
```

```bash
ciop-stop 0000267-150209145053100-oozie-oozi-W
```

## Author

Terradue
