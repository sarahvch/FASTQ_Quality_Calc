# FASTQ_Quality_Calc

<p>This script is designed for <b>FASTQ Illumina Deep Sequencing Files:</b> https://en.wikipedia.org/wiki/FASTQ_format
Each FASTQ file contains multiple lines of sequence data and corresponding quaility value for each sequence.</p> 

<p><b>Quaility</b></p>
<p>Quality is the probability that the base is incorrect. It is given in ASCII characters from ascii 33 to 126 (http://ascii.cl/). The exclamation mark "!" representes the lowest quality while the tilde "~" is the highest quality. This script assigns a number to each quality score, 0 being the lowest quality score and 93 being the highest quailty score. It then returns:</p>
<ul>
<li>Record Name</li>
<li>Total Quality Score for the Read</li>
<li>Percent of Total Possible Quality</li>
<li>ASCII Score</li>
<li>Total Number of Bases: 31</li>
</ul>

<p>As well as</p>

<ul>
<li>Total Reads in File</li>
<li>Average Perent of Total Possible Quality for Every Read</li>


<p>This script can work directly with files.fa files. Paste file path after directed by script. The script returns the total quality score added up for each read it also tells you the average quality score for the enitire file</p>

<p>To use this script drag and drop your file_path/file.fa into the console.</p>
