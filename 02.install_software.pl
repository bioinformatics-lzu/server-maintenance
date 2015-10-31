#! /usr/bin/env perl
use strict;
use warnings;

my $package_name=shift;

if(!$package_name){
    print STDERR "Which package do you want to install? ";
    $package_name=<STDIN>;
    chomp $package_name;
    if(!$package_name){
	print STDERR "Well...\n";
	exit();
    }
}
print STDERR "Are you sure to install [ $package_name ]? press y to continue: \n";

my $input=<STDIN>;
chomp $input;
$input=lc($input);
if($input eq "y" || $input eq "yes"){
    print STDERR "Let's GO!\n";
    open(O,"> installed_package.log");
    my ($sec,$min,$hour,$day,$mon,$year,$weekday,$yeardate,$savinglightday) = (localtime(time));
    $sec = ($sec < 10)? "0$sec":$sec;
    $min = ($min < 10)? "0$min":$min;
    $hour = ($hour < 10)? "0$hour":$hour;
    $day = ($day < 10)? "0$day":$day;
    $mon = ($mon < 9)?  "0".($mon+1):($mon+1);
    $year += 1900;
    my $time="year$year\/mon$mon\/day$day $hour\:$min\:$sec";
    print O "$time $package_name\n";
    close O;
}
else{
    print STDERR "Well...\n";
    exit();
}

my @node=(1..7,"f");

my $cmd="dnf install -y $package_name";

my $run_cmd="export http_proxy=proxy.lzu.edu.cn:8080; setsid $cmd 1>>install.log 2>>install.err";
system($run_cmd);

foreach my $node(@node){
    $node="node".$node;
    my $node_run="ssh $node \"$run_cmd\"";
    # print "$node_run\n";
    system($node_run);
}
