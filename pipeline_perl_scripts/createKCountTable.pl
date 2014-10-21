#!/usr/bin/perl

use strict;
use warnings;

#####
#Written by Jason Steen, Australian Centre for Ecogenomics, 22/10/2012
#This script takes a directory of KO counts from IMG, and converts it into a count table for all organisms and KO's present in said directory
#Errors/ommisions/suggestions j.steen2@uq.edu.au
####



my $output_name = pop(@ARGV);

my $name_column = 0;
my $count_column = 1;

my @filelist = @ARGV;
my %data;
open(OUT, ">$output_name") or die "cannot open $!";

print OUT "K_Number";

foreach my $file(@filelist){
    my @temp_name = split(/\//, $file);
    my $file_name = pop(@temp_name);
    print STDOUT "$file_name\n";
    my @temp_name_2 = split(/\./, $file_name);
    my $final_name = shift(@temp_name_2);
    print OUT "\t$final_name";
    open(IN, $file);
    while(my $line = <IN>){
        chomp($line);
        my @temp = split(/\t/, $line);
        $data{$temp[$name_column]}{$file} = $temp[$count_column];
        }            
close(IN);    
}
print OUT "\n";

my @values;
foreach my $keys (keys %data){
        push(@values, $keys)
}

foreach my $key(@values){
    print OUT "$key";
    foreach my $files(@filelist){
        if(exists($data{$key}{$files})){
            print OUT "\t$data{$key}{$files}";
        }else{
            print OUT "\t0";
        }
    }
    print OUT "\n";
}

close(IN);
close(OUT);
exit(0);
