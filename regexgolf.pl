#!/usr/bin/perl
use warnings;
use strict;

my @match;
my @dontmatch;
my ($regex,$score);
print<<EOF;

This is the game regex golf,if you match the words you win, All the Best!
\n
EOF
@match = ("telehack","telephone","telemetry","teletype");
@dontmatch = ("terminal","forbin","tinder","facebook");
print "You have to match : @match \n";
print "You dont have to match : @dontmatch \n";
print "Enter regex :";
$regex=<STDIN>;
chomp ($regex);
for (0...$#match){
	if ($match[$_] =~ /$regex/){
		print "CORRECT! Matching $match[$_]  ";
		$score++;
		print "score : $score \n";
		}
	else{	
		print "INCORRECT! Not Matching $match[$_]";
		$score--;
		print "score: $score \n";
		}
	if ($dontmatch[$_] !~ /$regex/){
		print "CORRECT! Not matching $dontmatch[$_] ";
		$score++;
		print "score : $score \n";
		}
	else{
		print "INCORRECT! Matching $dontmatch[$_]";
		$score--;
		print " Score : $score \n";
		}
}
print "Your score is : $score \n";
#{print "You win :D\n";}
#else
#{print "You lose :(\n";}

