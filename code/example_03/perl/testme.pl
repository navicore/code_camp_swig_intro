#!/usr/bin/perl
use holder;
use strict;
use warnings;

#################### test Object #########################

my $myobj = holder::Object->new();

my $m = "rusty is a cowboy";
#my $m = <>; chomp $m;

#$myobj->setText(0);
$myobj->setText($m);

my $r = $myobj->getText();

die unless "$m" eq "$r";

print("\$m and \$r should be the same:\n\t\$m = $m\n\t\$r = $r\n");

#################### test ObjectHolder #########################

my $myholder = holder::ObjectHolder->new();
die if "$myholder" eq "";

#$myholder->setObject("hiya");
$myholder->setObject($myobj);

my $other = $myholder->getObject();
die unless $other->getText() eq $r;

