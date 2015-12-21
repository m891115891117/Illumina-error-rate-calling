#!/usr/bin/perl
##########################################################
#trimming & merging tool: trimming process
#author: Pengze Ma
#address:University of Fudan,college of life science,C607
#email:mpz2263@sina.com
##########################################################

use strict;
use warnings;

#input the file from commend line
my $file=$ARGV[0];

#open the standard input file
open(my $fh, '<', $file)
    or die "Could not open file '$file' $!";

#declare output file
my $fileout=$ARGV[0].'output.txt';
open(my $fo, '>', $fileout) or die "Could not open file '$fileout' $!";


#print the title for output flieout
print $fo " \t","$ARGV[0]\t","\t","\t","\n";
print $fo "Po\t","A\t","C\t","G\t","T\n";


#while loop to read each line
while(my $line=<$fh>){
chomp($line);

#the input stream are splited by tab delimiter,
#so we can use \t to generate each column
#put each coulmn in @col array
my @col=split /\t/,$line;

#generate 1st 2nd 3rd coulmn;
#column one:chromosome name
#column two:position on chromosome
#column three:the whole number of nucleotide
#column four:nucleotide string
my $colone=$col[0];
my $coltwo=$col[1];
my $colthree=$col[2];
my $colfour=$col[3];

#trimming:remove symbol$,number0-9,punctuations,symbles,etc
$colfour=~s/\$|\^|\]|\>|[0-9]|\*|\-|\+|\,|E|F//gi;

#caculate 'AGCT' from each line
my @eachletter=split('',$colfour);

#set default counter
my $countA=0;
my $countC=0;
my $countG=0;
my $countT=0;

#counting loops
  foreach my $base(@eachletter){
    if(($base eq 'A')||($base eq 'a')){
      $countA++;
    }
    elsif(($base eq 'C')||($base eq 'c')){
      $countC++;
    }
    elsif(($base eq 'G')||($base eq 'g')){
      $countG++;
    }
    elsif(($base eq 'T')||($base eq 't')){
      $countT++;
    }
  }



#display result
print $colone,"\t",$coltwo,"\t",$colthree,"\t","$colfour\t","A=$countA\t","C=$countC\t","G=$countG\t","T=$countT\n";


#save the result into file
print $fo $coltwo,"\t","$countA\t","$countC\t","$countG\t","$countT\n";


#end of while loop
}


close $fh;
close $fo;
