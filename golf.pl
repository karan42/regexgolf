#!/usr/bin/perl

use strict;
use warnings;
use Switch;

my (%commands,@wordlist,@nomatch,@scores,$continue,$state);
my $menu ="\n\nHello Choose One:\n\n[1]Lessons\n[2]Game\n[3]Exit\n\nPlease Enter a Selection:";
print $menu;

$continue= <STDIN>;
$continue = inputsan ($continue);
while ($continue){
	switch ($continue) {
		case 1  {
			print "You want to do lessons\n";
			lessons();
			}
		case 2  {
			print "\n \nLet's play the game !!\n \n \n";
			game();
			$continue=0;
			}
		case 3  {
			print "You chose exit, good bye!\n";
			$continue=0;
			}
		case 42 {
			print "We are still searching for the question to that answer \n";
			$continue=0;
			}
		case 99 {
			print $menu;
			$continue=<STDIN>;
			$continue = inputsan($continue);
			}
		else {
			print "Please enter a valid selection:";
			$continue = <STDIN>;
			$continue = inputsan($continue);
			}
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


sub lessons {
	my (%lessonmenu,$lessonno);
	%lessonmenu = (
		1 => \&firstless,
		2 => \&repit,
		3 => \&startend,
		4 => \&specialchars,
		5 => \&backrefs,
	);
print<<EOF;
	Select lesson number to start :
	[1]Basics (Numbers, Digits)
	[2]Repititions
	[3]Starting and Ending
	[4]Special Characters
	[5]Capturing and backrefes
	[6]GO TO MENU
	
EOF
	print "Give your choice :";
	$lessonno=<STDIN>;
	chomp $lessonno;
	if (!exists $lessonmenu{$lessonno}){
					    print "Please enter a number between 1 and 6 ";}
	$lessonmenu{$lessonno}();	
	if ($lessonno == 6){$continue = 99;}
	print "you chose : $lessonno\n"
	}

sub firstless { 
	print 1;}
sub repit {
	print 2;}
sub startend {
	print 3;}
sub specialchars {
	print 4;}
sub backrefs{
	print 5;}



sub game {
	


my (%match,%dontmatch,$level,$regex,$score);
print<<EOF;

This is the game regex golf,if you match the words you win, All the Best!
\n
EOF
	%match = (
		1 => ["telehack","telephone","telemetry","teletype"],
		2 => ["abcabc","taptap","beepbeep","baudbaud"],
		3 => ["hack","hackconf","hacker","hacktree"],
		4 => ["209-369-1397","215 259 4308","2109259288"],
		5 => ["abac","bedded","caffa","daff","dead","faded"],
		6 => ["allochirally","anticovenating","ethanethlol","heavyheaded"]
		);

	%dontmatch = (
		1 => ["forbin","colossus","polybius","arpa"],
		2 => ["bbs","zen","tron","adams"],
		3 => ["elite","rfid","/dev/null","PEBKAC"],
		4 => ["1984","1977","3019121308","508 460 255"],
		5 => ["mucose","towned","relose","threap","messrs","martyr"],
		6 => ["articker","gummage","galvanotactic","kashga"]
		);
	#@match = ("telehack","telephone","telemetry","teletype");
	#@dontmatch = ("terminal","forbin","tinder","facebook");
foreach my $i (1..6){
	print "\n \n \n \nYou have to match : @{$match{$i}} \nYou dont have to match : @{$dontmatch{$i}} \nEnter regex :";
	$regex=<STDIN>;
	print "hello: ${$match{$i}}[1]\n";
	chomp ($regex);
		for (0..$#{$match{$i}}){
        		if ( ${$match{$i}}[$_] =~ /$regex/){
                		$score++;
               	 		print "CORRECT! Matching ${$match{$i}}[$_] ; Score is $score  \n";
                	}
	       		else{
                		$score--;
                		print "INCORRECT! Not Matching ${$match{$i}}[$_] ; Score is $score \n";
                	    }
        		if ( ${$dontmatch{$i}}[$_] !~ /$regex/){
                		$score++;
                		print "CORRECT! Not matching ${$dontmatch{$i}}[$_] ; Score is $score \n";
			}
        		else{
                		$score--;
                		print "INCORRECT! Matching ${$dontmatch{$i}}[$_] ; Score is $score \n";
                	     }

		}


		print "Your total score is : $score \n";}
print "Press y to play again, n to exit :";
my $yn = <STDIN>;
chomp $yn;
if ($yn =~ "y") { game ();}
	
}
