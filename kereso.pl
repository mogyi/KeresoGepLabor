#!/usr/bin/perl
use strict;
use warnings;

use Path::Class;
use autodie;

my $dir = dir();
my $file = dir->file("top_depth.txt");

my $file_handle = $file->openr();

my $pagenumber = $file_handle->getline();
my @pages;

for (my $i=1;$i<=$pagenumber; $i++) {
my $line = $file_handle->getline();
my @actline = split(/ /,$line);
$pages[$actline[0]]=$actline[1];
print $pages[$actline[0]];
}

my $linknumber = $file_handle->getline();
