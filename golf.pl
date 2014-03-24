#!/usr/bin/perl

use strict;
use warnings;


my (@wordlist,@nomatch,@scores,$continue,$state);

$continue = 1;
print "\n\nHello Choose One:\n\n[1]Lessons\n[2]Game\n[3]Exit\n\nPlease Enter a Selection:";
$continue= <STDIN>;

while ($continue) {
	if ($continue==1){
		print "You want to do lessons\n";
		print "Enter a anther choice:";
		$continue=<STDIN>;
		chomp $continue;
	}
	elsif ($continue==2) {
		print "You want to play the game \n";
		print "Enter a anther choice:";
		$continue=<STDIN>;
		chomp $continue;
	}

	
	elsif ($continue==3){
		print "you chose exit, good bye!\n";
		last;
	}
	else {
		print "enter a valid selection:";
		$continue = <STDIN>;
		chomp $continue;


	}
}
