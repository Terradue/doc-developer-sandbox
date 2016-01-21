ciop-copy
=========

Synopsis
--------

**ciop-copy** {url} [option...]

Description
-----------

``ciop-copy`` copies to a local folder the products associated to the URL passed as argument. ciop-copy supports several drivers such as HTTP, HTTPs, HDFS, etc. ciop-copy can also copy products passed as RDF catalogue entry URLs.

Options
-------

``url``
    one or more product urls

``-h``
    displays the help page

``-a``
    abort on first error without attempting to process further URLs

``-q``
    quiet mode, local filenames are not echoed to stdout after transfer

``-f``
    force transfer of a physical copy of the file for nfs and HDFS urls.

``-d driver-file``
    get additional drivers from shell file <driver-file>. Drivers shall contain a named
    <protocol> driver

``-o|O <out-dir>``
    same as -c -o <out-dir>. Kept for retro-compatibility.

``-c``
    creates the output directory if it does not exist

``-p prefix``
    prepend the given prefix to all output names

``-z``
    provide output as a compressed package (.gz for files or .tgz for folders). NOTE that it
    will not compress already compressed files (.gz, .tgz or .zip)

``-U|--no-unzip<prefix>``
    disable file automatic decompression of .gz, .tgz and .zip files

``-rt seconds<prefix>``
    define the time (in seconds) between retries (default is 60)

``-t timeout<prefix>``
    defines the timer (in seconds) for the watchdog timeout applicable to gridftp, scp, ftp,
    http, and https schemes (default is 600 seconds)

``-R timeout``
    do not retry transfer after timeout

``-D``
    set debug mode for command output parsing debugging

``-s``
    skip download if sink path already exists

``-x<pattern>``
    exclude the files matching the pattern

``-w<pattern>``
    do not overwrite single files iif already exist 

Output
------

Unless the -q option is used (quiet mode), the local path of each file or directory
downloaded after each URL transfer is echoed, one per line.

Unless the -U option is used, .gz or .tgz output files will be decompressed.

Unless the -H option is used, the software will follow the RDF <dclite4g:onlineResource> and
the HTML href & refresh tags.

Exit Status
-----------

``ciop-copy`` command exits

**0** all URLs were successfully downloaded

**1** an error occured during processing

**255** environment is invalid (e.g. invalid working directory) or invalid options are provided

**254** output directory does not exist or failed creating it (with -c option)

If the -a option is used, the exit code is set to the error code of the last URL transfer:

**252** no driver available for URL

**251** an existing file or directory conflicts with the sink for the URL in the output
directory

**250** an error occured while unpacking the output file or when packaging/compressing the
output file (when -z or -Z option is used)

**128** a timeout occured while fetching an url

**127** a fatal error occured, source of error is not known or not handled by driver

**128** error codes specific to the transfer scheme

**1** resource pointed by input URL does not exist

Examples
--------

**Example 1**. Copy a product from the online resources included in the RDF catalogue entry URL
       (it requires ESA UM-SSO credentials)

.. code-block:: bash

    ciop-copy -o . http://eo-virtual-archive4.esa.int/search/ASA_IM__0P/ASA_IM__0CNPAM20080706_092427_000000162070_00079_33199_3531.N1/rdf

**Example 2**. simple copy of an URL (master_url), the variable master_local_file will contain the value of the download file local path

.. code-block:: bash

    master_local_file=‘echo $master_url | ciop-copy -o $TMPDIR -‘

See Also
--------

:doc:`ciop-catcp <../catalogue/ciop-catcp>`

Author
------

Terradue