#!/bin/bash

##########################################################
#trimming & merging tool
#author: Pengze Ma
#address:University of Fudan,college of life science,C607
#email:mpz2263@sina.com
##########################################################

#set file as variables
inputsample=$1
inputtest=$2

#if the input files are not equal 2,the useage and warnning will be given.
if [ $# != 2 ]
then
  echo  "useage: bash [scpipt] [sample file] [test file]"
  echo  "Please check your input, insure the order of the input files"
else
  #if the file exist in the current directory,the trimming process will
  #be run, else give a warnning message
  if [ -e $inputsample ] && [ -e $inputtest ];
    then
      echo "Note the input order"
      mysample=trimsample
      mytest=trimtest

      #using samtools mpileup and generate some columns.
      samtools mpileup $inputsample | cut -f 1,2,4,5 > $mysample
      samtools mpileup $inputtest | cut -f 1,2,4,5 > $mytest


      #trimming by perl script,then generate calculation output.
      perl trimming.pl $mysample
      perl trimming.pl $mytest


      #merging
      perl merging.pl $mysample"output.txt" $mytest"output.txt"

    else
      echo "Cannot find the sample or test file in this directory, Please check your input."
    fi
fi




