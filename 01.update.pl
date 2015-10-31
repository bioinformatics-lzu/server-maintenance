#! /usr/bin/env perl
use strict;
use warnings;

print STDERR "Do you really want to update? press y to continue: ";
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

my $cmd="dnf update -y";

my $run_cmd="export http_proxy=proxy.lzu.edu.cn:8080; setsid $cmd 1>>update.log 2>>update.err";
system($run_cmd);

foreach my $node(@node){
    $node="node".$node;
    my $node_run="ssh $node \"$run_cmd\"";
    # print "$node_run\n";
    system($node_run);
}
