#! /usr/bin/env perl
use strict;
use warnings;

my $user_name=shift;

if(!$user_name){
    print STDERR "Which user do you want to sync? ";
    $user_name=<STDIN>;
    chomp $user_name;
    if(!$user_name){
	print STDERR "Well...\nexit now!\n";
	exit();
    }
}
print STDERR "Are you sure to sync [ $user_name ]? press y to continue: \n";

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

my $cmd="mkdir /home/share/users/$user_name/.ssh/; scp old_master:/home/users/$user_name/.ssh/authorized_keys /home/share/users/$user_name/.ssh/; scp old_master:/home/users/$user_name/.ssh/id_rsa /home/share/users/$user_name/.ssh/; scp old_master:/home/users/$user_name/.ssh/id_dsa /home/share/users/$user_name/.ssh/; chown $user_name /home/share/users/$user_name/.ssh/*";

my $run_cmd="$cmd";
system($run_cmd);
