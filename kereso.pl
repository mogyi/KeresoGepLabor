#!/usr/bin/perl
use strict;
use warnings;

use Path::Class;
use autodie;

my $dir = dir();
my $file = dir->file("top_depth.txt");

my $file_handle = $file->openr();

while( my $line = $file_handle->getline() ) {
        print $line;
}