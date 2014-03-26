Data preparation
================

The data preparation step foresees to copy test data to the sandbox and register it in the sandbox local catalogue. 
The application uses Envisat MERIS Level 1 Reduced Resolution data. ESA provides access to the full mission data through MyEarthNet and via the G-POD framework.
For the purpose, Terradue has created a catalogue with a subset of the Envisat MERIS Level 1 Reduced Resolution mission data. 
This section shows how to copy and register the test data to the sandbox local storage and sandbox local catalogue. 
The same techniques can be applied to the ESA G-POD catalogues or other OpenSearch catalogues.
 
Copying test data on your Sandbox
*********************************

The sandbox includes a catalogue exposing the OpenSearch search engine. 
A Web interface is available at http://<sandbox IP>/catalogue/sandbox
When initiated the sandbox contains no data so clicking on the Search button will not return results.

You will the ciop-catcp utility to copy both the data and metadata from the source catalogue. The source catalogue is the Terradue catalogue containing a subset of the Envisat MERIS mission. 
The ciop-catcp utility takes an Open Search URL and a few options to optionally copy the data and register the metadata.  

On the sandbox shell run the command:

<pre>
ciop-catcp -m byval "http://grid-eo-catalog.esrin.esa.int/catalogue/gpod/MER_RR__1P/rdf?start=2012-04-05T10:00:00&stop=2012-04-05&count=5"
ciop-catcp -m byval "http://grid-eo-catalog.esrin.esa.int/catalogue/gpod/MER_RR__1P/rdf?start=2012-04-04T10:00:00&stop=2012-04-04&count=5"
</pre>    

TODO: complete the command list

To check the registered data and its accessibility go back to the sandbox catalogue web interface and click the Search button. The graphical interface will show the data now available om the sandbox.
Click on one product of the list on the left and then on the Access tab below the map. Finally click on the HTTP URL. The download of the select MERIS Level 1 product starts.

Copy the link to the selected MERIS file, go back to the sandbox shell and type

<pre>
$> cd 
$> ciop-copy -o ./ <URL of the MERIS file> 
</pre> 

This will copy the MERIS product from the sandbox to your home folder.

The ciop-copy utility does more than simpy copying HTTP URLs, it can also consume the catalogue entry RDF URL as input. 
Go back to the web interface, and click on Metadata tab, and on the RDF logo. This will open the MERIS product catalogue entry in the RDF format. Copy that URL and use it as argument to ciop-copy:

<pre>
$> cd
$> ciop-copy -o ./ <catalogue URL of the MERIS file in the RDF format>
</pre>

You are done! You have test data on your sandbox and have understood how to copy it from a storage (the sandbox storage).
