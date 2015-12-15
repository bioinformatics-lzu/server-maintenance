#! /usr/bin/env perl
use strict;
use warnings;

my $user_name=shift;

if(!$user_name){
    print STDERR "Which user do you want to delete? ";
    $user_name=<STDIN>;
    chomp $user_name;
    if(!$user_name){
	print STDERR "Well...\nexit now!\n";
	exit();
    }
}
print STDERR "Are you sure to delete [ $user_name ]? press y to continue: \n";

my $input=<STDIN>;
chomp $input;
if($input eq "y" || $input eq "yes"){
    print STDERR "Let's GO!\n";
}
else{
    print STDERR "Well...\nexit now!\n";
    exit();
}

my @node=(1..7,"f");

my $cmd="userdel $user_name";

my $run_cmd="$cmd";
system($run_cmd);

foreach my $node(@node){
    $node="node".$node;
    my $node_run="ssh $node \"$run_cmd\"";
    # print "$node_run\n";
    system($node_run);
}
