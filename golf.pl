#!/usr/bin/perl

use strict;
use warnings;


my (@wordlist,@nomatch,@scores,$continue,$state);

print "\n\nHello Choose One:\n\n[1]Lessons\n[2]Game\n[3]Exit\n\nPlease Enter a Selection:";
$continue= <STDIN>;

while ($continue) {
	print "while entry : $continue";
	if ($continue==1){
		print "You want to do lessons\n";
		print "Enter another choice 1:";
		$continue=<STDIN>;
		print "why is this not prining\n";
		print "input from stid : $continue\n";
		$state = inputsan (chomp($continue));
		$continue = $state;
		print "level 1 complete";
	}
	elsif ($continue==2) {
		print "You want to play the game \n$continue\n";
		print "Enter a anther choice 2 :";
		$continue=<STDIN>;
		$continue = inputsan($continue);print $continue;
	
	}

	
	elsif ($continue==3){
		print "you chose exit, good bye!\n";
		last;
	}
	elsif ($continue==42) {
		print "WE are still searching for the question to that answer \n";
		last;
	}
	else {
		print "enter a valid selection:";
		$continue = <STDIN>;
		$continue = inputsan(chomp($continue));
	}
}


sub inputsan {
	my $selection = @_[0];
	print join(",", @_);
	chomp $selection;
	if($selection !~ /\d{2}/) {
		print "Please enter only a 2 digit number :";
       		$selection= <STDIN>;
 		return $selection;		
}
}
