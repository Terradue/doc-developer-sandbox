
 Arranging the BandMaths Operator results

The application goal is to produce daily binned products so the binning processing step needs to have its inputs well organized so that it aggregates in time and space only the products of a given day. In terms of job template, you will define the path to the streaming executable, one parameter: the period (a day) and instruct the framework that only one task has to be run.

<pre>

    <jobTemplate id="arrange">

        <streamingExecutable>/application/arrange/run.R</streamingExecutable>

            <defaultParameters>
                <parameter id="period">day</parameter>

            </defaultParameters> <defaultJobconf>

                <property id="ciop.job.max.tasks">1</property>

            </defaultJobconf>

    </jobTemplate>

</pre>
