#!/usr/bin/perl
##########################################################
#trimming & merging tool:merging process
#author: Pengze Ma
#address:University of Fudan,college of life science,C607
#email:mpz2263@sina.com
##########################################################

use strict;
use warnings;

#input the file from commend line
my ($fileone,$filetwo) = @ARGV;
#print $fileone,"\t",$filetwo,"\n";


#open the standard input file
open(my $fone, '<', $fileone)
    or die "Could not open file '$fileone' $!";

open(my $ftwo, '<', $filetwo)
    or die "Could not open file '$filetwo' $!";

#declare output file
my $fileout='appended.txt';
open(my $fout, '>', $fileout)
    or die "Could not open file '$fileout' $!";

#declare variables
my $line1;
my $line2;

#while loop,reading each line of two input files,
#and print out the required columns.
while(defined($line1=<$fone>) and defined($line2=<$ftwo>)){
  chomp($line1);
  chomp($line2);

  #each line is sepreated by tab delimiter.
  my @line1=split("\t",$line1);
  my @line2=split("\t",$line2);
  print $fout join("\t",@line1[0,1,2,3,4],@line2[1,2,3,4]),"\n";

#end of while loop
}


close $fone;
close $ftwo;
close $fout;
