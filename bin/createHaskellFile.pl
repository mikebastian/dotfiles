#!/usr/bin/perl
use strict;
use warnings;

use Path::Class;
use autodie;
use Cwd;

if( $#ARGV + 1 < 1 ) {
    print "Please give the name of the file to create!\n";
    exit;
}

my $dir = dir(getcwd);
my $file = $dir->file($ARGV[0]);

my $file_handle = $file->openw();
my @list = ('{- |',
            'Module:        $file',
            'Description:   <Description>',
            'Copyright:     (c) <Authors>',
            'License:       <License>',
            '',
            'Maintainer:    <email>',
            'Stability:     <stability>',
            'Portability:   portable | non-portable (<reason>)',
            '',
            '<module description starting at first column>',
            '-}'
           );

foreach my $line ( @list ) {
    $file_handle->print($line. "\n");
}
