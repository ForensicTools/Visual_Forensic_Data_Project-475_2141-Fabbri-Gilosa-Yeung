#!/usr/local/bin/perl

use strict;
use warnings;

#variables
my $filename;

#opens the current directory
opendir DIR, ".";


#prints the files in the directory
while ( $filename = readdir(DIR) ) 
{
	print $filename , "\n";
}

closedir DIR;
