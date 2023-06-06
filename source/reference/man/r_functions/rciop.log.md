# rciop.log \{rciop}

## Description

Echoes a log entry

## Usage

```bash
rciop.log (type, message, proc='')
```

## Arguments

`type`

: the logging level: one value of DEBUG (or d, debug), WARNING (or w, warn, WARN), ERROR (or e, error, err) or INFO (or i,info)

`message`

: the message to be displayed

`process`

: the process name to provide context about the logging entry

## Details

This function echoes logging messages in the application stderr channel and resets the execution wall time clock.

## Value

Empty

## Examples

```bash
rciop.log ("INFO", "I'm a logging message")
rciop.log ("DEBUG", "I'm a debugging message", "myapp")
```

## Author

Terradue
