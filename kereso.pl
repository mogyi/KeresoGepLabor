#!/usr/bin/perl
use strict;
use warnings;

use Path::Class;
use autodie;

#f�jlbeolvas�s
my $dir = dir();
my $file = dir->file("top_depth.txt");

my $file_handle = $file->openr();

my $pagenumber = $file_handle->getline();
my @pages;
#oldallista beolvas�sa
for (my $i=1;$i<=$pagenumber; $i++) {
my $line = $file_handle->getline();
my @actline = split(/ /,$line);
$pages[$actline[0]]=$actline[1];
}

my $linknumber = $file_handle->getline();
#szomsz�ds�gi m�trix felt�lt�se null�val
my @szomszedok;
for (my $n=1; $n<=$pagenumber; $n++){
	for (my $m=1; $m<$pagenumber; $m++)	{$szomszedok[$n][$m] = 0;}
}

#szomsz�ds�gi m�trix kit�lt�se
for (my $j=1;$j<=$linknumber; $j++) {
my $line = $file_handle->getline();
my @actline = split(/ /,$line);
$szomszedok[$actline[0]][$actline[1]] = 1;

}

#teszt
#print $szomszedok[2][117];
#print $szomszedok[2][78];


#pagerank

my @pagerank;
#pagerank kezdeti 1/n
for (my $i=1;$i<=$pagenumber;$i++){$pagerank[$i]=1/$pagenumber;}
print "$pagerank[1]\n";
for (my $i = 1;$i<=$pagenumber;$i++){ 
my @backlink;
	
		for (my $j=1;$j<=$pagenumber;$j++){
			
				if ($szomszedok[$j][$i]) {push(@backlink,$j);}
				}

my $szumma = 0;
		foreach my $bl (@backlink){
			my $kifok=0;
			
				for (my $n=1;$n<$pagenumber;$n++) {
					if ($szomszedok[$bl][$n] == 1) {$kifok++;}
				}
			
			
			$szumma = $szumma + ($pagerank[$bl]/$kifok);
		}
		
$pagerank[$i]=0.88*$szumma+(1-0.88)*($pagenumber);
}

print $pagerank[1];