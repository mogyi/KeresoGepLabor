#!/usr/bin/perl
use strict;
use warnings;

use Path::Class;
use autodie;

#fájlbeolvasás
my $dir = dir();
my $file = dir->file("top_depth.txt");

my $file_handle = $file->openr();

my $pagenumber = $file_handle->getline();
my @pages;
#oldallista beolvasása
for (my $i=1;$i<=$pagenumber; $i++) {
my $line = $file_handle->getline();
my @actline = split(/ /,$line);
$pages[$actline[0]]=$actline[1];
}

my $linknumber = $file_handle->getline();
#szomszédsági mátrix feltöltése nullával
my @szomszedok;
for (my $n=1; $n<=500; $n++){
	for (my $m=1; $m<500; $m++)	{$szomszedok[$n][$m] = 0;}
}

#szomszédsági mátrix kitöltése
for (my $j=1;$j<=$linknumber; $j++) {
my $line = $file_handle->getline();
my @actline = split(/ /,$line);
$szomszedok[$actline[0]][$actline[1]] = 1;
}

#teszt
print $szomszedok[2][117];
print $szomszedok[2][78];