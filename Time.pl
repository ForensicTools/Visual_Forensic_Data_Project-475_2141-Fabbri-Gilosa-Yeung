#!/usr/local/bin/perl -w
#By Alessandro Fabbri

#Has the program use the Win32API::File:Time module which allows you to access files
#Create, Modify, Access times. Also has the program use POSIX which is used to convert
#epoch time into readable month/day/year hour:minute:second format
use Win32API::File::Time qw{:win};
use POSIX qw(strftime);
use strict;

#Creates all the variables to be used in the program with default values
my $file = 'test.txt';
my $atime = '0';
my $mtime = '0';
my $ctime = '0';
my $time1 = time();
my $time2 = time();
my $time3 = time();

#Sets the directory that is going to be scanned
my $directory = '/Downloads';

#Opens the directory
opendir (DIR, $directory) or die $!;

#A loop that will run through the entire directory stopping at all files it finds
while (my $file = readdir(DIR)) {
	#Performs the GetFileTime subroutine which takes the name of the file and returns
	#its access time, modify time, and creation time
	($atime, $mtime, $ctime) = GetFileTime ($file);
	
	#Converts the time for the three values from epoch time into readable time
	$time1 = strftime("%m/%d/%Y %H:%M:%S", localtime($atime));
	$time2 = strftime("%m/%d/%Y %H:%M:%S", localtime($mtime));
	$time3 = strftime("%m/%d/%Y %H:%M:%S", localtime($ctime));

	#Prints out all the given values for the file, then loops
	print "$file, $time1, $time2, $time3\n";
	}
#Closes the directory
closedir (DIR);
