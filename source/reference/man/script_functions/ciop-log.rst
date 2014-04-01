ciop-log (3)
============

Synopsis
--------

**ciop-log** [level] [message] <process>

Description
-----------

``ciop-log`` ciop-log logs messages during the execution. The log
entries contain the entry date in format YYYY-MM-DDThh:mm:ss (the date
does not contain the time zone), the log level (DEBUG, WARNING, INFO or
ERROR), the context and the message.

Options
-------

``level``
  the logging level: one value of DEBUG (or d, debug), WARNING (or w, warn, WARN), ERROR (or e, error, err) or INFO (or i,info)

``message``
  the message to be displayed

``process`` 
  the process name to provide context about the logging entry

Output
------

ciop-log echoes the log entry in the stderr channel.

Exit Status
-----------

``ciop-log`` command exits

0 the log entry was successful

Examples
--------

.. code-block:: bash

  ciop-log "DEBUG" "This is a debug message"
      
.. code-block:: bash

  ciop-log "INFO" "This is an information message" "myapp"
  
See Also
--------

:doc:`ciop-getparam <ciop-ciop-getparam>`

Author
------

Terradue
