#!/usr/bin/perl

use strict;
use warnings;


my $input = shift @ARGV;
my $output = shift @ARGV;

my @colours = ("#FFFFFF", "#F7FCFD", "#E0ECF4", "#BFD3E6", "#9EBCDA", "#8C96C6", "#8C6BB1", "#88419D", "#810F7C", "#4D004B");

open(IN, "$input");

my $header = <IN>;
open(OUT, ">$output");

print OUT "#ko\t$header";
while(my $line = <IN>){
	chomp($line);
	my ($rowname, @temp) = split(/\t/, $line);
	print OUT "$rowname";
	foreach my $value (@temp) { 	
		if($value > 0){print OUT "\t$colours[9]"}else{print OUT "\twhite,red"}
		}
	print OUT "\n";
}


close(IN);
close(OUT);
exit(0);



