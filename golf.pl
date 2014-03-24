#!/usr/bin/perl

use strict;
use warnings;


my (@wordlist,@nomatch,@scores,$continue,$state);

print "\n\nHello Choose One:\n\n[1]Lessons\n[2]Game\n[3]Exit\n\nPlease Enter a Selection:";
$continue= <STDIN>;
$continue = inputsan ($continue);
while ($continue) {
	if ($continue==1){
		print "You want to do lessons\n";
		print "Enter another choice :";
		$continue=<STDIN>;
		$continue=inputsan($continue);
	}
	elsif ($continue==2) {
		print "You want to play the game \n";
		print "Enter a anther choice :";
		$continue=<STDIN>;
		$continue = inputsan($continue);
	
	}

	
	elsif ($continue==3){
		print "you chose exit, good bye!\n";
		last;
	}
	elsif ($continue==42) {
		print "We are still searching for the question to that answer \n";
		last;
	}
	else {
		print "enter a valid selection:";
		$continue = <STDIN>;
		$continue = inputsan($continue);
	}
}


sub inputsan {
	my $selection = $_[0];
	chomp $selection;
	if($selection !~ /^\d{1,2}$/) {
		print "Please enter only a 2 digit number :";
       		$selection= <STDIN>;
 		inputsan($selection);		
	}
	return $selection;
}
