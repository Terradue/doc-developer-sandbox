Frequently asked questions

** Why are some log entries going to stderr while others go to stdout**?

The framework log entries (e.g. using ciop-log or ciop-copy) all go to stderr.

Application log entries may go to stderr or stdout depending on the application it self.

Example: 

.. code-block:: bash

  ls missing_file
  
the message *ls: cannot access missing_file: No such file or directory* will go to stderr since this is how *ls* behaves.

.. code-block:: bash

  echo 'Hello World!'
  
The message *Hello World!* will go to stdout
