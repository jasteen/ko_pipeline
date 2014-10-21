Counting and annotation genomes against KEGG

Step 1 - clone this github project somewhere useful (probably into your home directory)

Step 2 - Annotate your genomes using PROKKA or similar.  you need a single folder containing all of the amino acid fasta files (.faa normally) from your genomes/bins.

Step 3 - Modify the path to the install location in pipeline.txt

Step 4 - Choose the number of CPU's.  WARNING: this is the number of CPU's per blast.  if you have 10 .faa files and choose 4 threads, you will spawn 40 cpu's worth of processes

Step 5 - from the folder containing your .faa files, run this pipeline.
	
	module load bpipe
	bpipe run /path/to/pipeline.txt *.faa

Step 6 - you probably want to turn the output files into something useful.  I normally do:

	for i in *.tab; do awk '{print $1"\t"red}' $i > $i.coloured.tab; done
	perl /installed/location/pipeline_perl_scripts/percentage_containing_K.pl summary_table.txt percentage_coverage.tab
	perl /installed/location/pipeline_perl_scripts/presence_absence_across_community.pl summary_table.txt presence_absence.tab

Step 7 - Visualise files on KEGG
Step 8 - Profit


