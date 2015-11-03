#! /usr/bin/env perl
use strict;
use warnings;

print STDERR "Mount in all nodes? press y to continue: ";
my $input=<STDIN>;
chomp $input;
$input=lc($input);
if($input eq "y" || $input eq "yes"){
    print STDERR "Let's GO!\n";
}
else{
    print STDERR "Well...\n";
    exit();
}

my @node=(1..7,"f");

my $cmd="mount -a";
my $run_cmd=$cmd;
#my $run_cmd="setsid $cmd 1>>time.log 2>>time.err";
system($run_cmd);

foreach my $node(@node){
    $node="node".$node;
    my $node_run="ssh $node \"$run_cmd\"";
    # print "$node_run\n";
    system($node_run);
}
