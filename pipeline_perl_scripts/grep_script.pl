#!/usr/bin/perl

use strict;
use warnings;

my $lookup = $ARGV[0];
my $input = $ARGV[1];
my $output = $ARGV[2];

my %hash;
my %hash2;
my @array;

open(LOOKUP, "$lookup");
while(my $line = <LOOKUP>){
	chomp($line);
	if($line =~ /^ko/){
		my($knumber,$gene) = split(/\t/, $line);
		$hash{$gene}=$knumber;
	}else{next}
}
close(LOOKUP);

open(INPUT, "$input");
open(OUTPUT, ">$output");

while(my $line = <INPUT>){
	chomp($line);
	my @temp = split(/\t/, $line);
	if(exists $hash{$temp[1]}){
		push(@array, $hash{$temp[1]});	
	}else{next}
}


foreach my $value(@array){
	if(exists $hash2{$value}){
                        $hash2{$value}{'count'}++;
                }else{
                        $hash2{$value}{'count'}=1;
                }
        }


foreach my $key( keys %hash2){
	print OUTPUT "$key\t$hash2{$key}{'count'}\n";
	}

	
close(INPUT);
close(OUTPUT);
exit(0);



