#!/usr/bin/perl

use strict;
use warnings;


my $path = shift(@ARGV);
my $file = shift(@ARGV);
my $output = shift(@ARGV);



my @colours = ("#FFFFFF", "#F7FCFD", "#E0ECF4", "#BFD3E6", "#9EBCDA", "#8C96C6", "#8C6BB1", "#88419D", "#810F7C", "#4D004B");

open(IN, "$path/$file");
my $null = <IN>;
open(OUT, ">$path/$output");

while(my $line = <IN>){
	chomp($line);
	my ($rowname, @temp) = split(/\t/, $line);
	my $linecount = 0;
	foreach my $value (@temp) { 	
		print "$value\t";
		if($value > 0){$value = 1}else{$value=0}
		print "$value\n";
		$linecount = $value + $linecount;
		}
	$linecount = $linecount / @temp;
	if ($linecount == 1){print OUT "$rowname\tred\n"}
#	elsif($linecount >= 0.9){print OUT "$rowname\t$colours[9]\n"} 
	elsif($linecount >= 0.8){print OUT "$rowname\t$colours[9]\n"}
#	elsif($linecount >= 0.7){print OUT "$rowname\t$colours[7]\n"}
	elsif($linecount >= 0.6){print OUT "$rowname\t$colours[8]\n"}
#	elsif($linecount >= 0.5){print OUT "$rowname\t$colours[5]\n"}
	elsif($linecount >= 0.4){print OUT "$rowname\t$colours[7]\n"}
#	elsif($linecount >= 0.3){print OUT "$rowname\t$colours[3]\n"}
	elsif($linecount >= 0.2){print OUT "$rowname\t$colours[6]\n"}
	elsif($linecount >= 0.01){print OUT "$rowname\t$colours[5]\n"}
}


close(IN);
close(OUT);
exit(0);



