Node clustering
===============

The R DBSCAN algorithm implementation [#f1]_ allows defining several parameters, the job template is created with:
* eps which is the reachability distance defaulting to 10
* minpts, the rreachability minimum no. of points defaulting to 10

Other DBSCAN parameters could be included to experiment the clustering algorithm fine tuning (not the goal of this experiment).

Algal blooms correspond to high values of MCI, so the template allows defining a threshold defaulting to 100.5 so the DBSCAN clustering will run against thos pixels with the MCI value above the threshold value.

<pre>
  <jobTemplate id="clustering">
    <streamingExecutable>/application/clustering/run.R</streamingExecutable>
    <defaultParameters>
	  <parameter id="eps">10</parameter>
	  <parameter id="minpts">10</parameter>
      <parameter id="threshold">100.5</parameter>
    </defaultParameters>
    <defaultJobconf>
      <property id="ciop.job.max.tasks">1</property>
    </defaultJobconf>
  </jobTemplate>
</pre>

.. rubric:: Footnotes

.. [#f1]
