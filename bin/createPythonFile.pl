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
my @list = ('#!/usr/bin/env python',
            '# encoding: utf-8',
            '"""',
            'stylight.',
            '~~~~~',
            '',
            ':copyright: (c) 2012 by Stylight GmbH, see AUTHORS for more details.',
            ':license: see LICENSE for more details.',
            '"""',
            '',
            ''
           );

foreach my $line ( @list ) {
    $file_handle->print($line. "\n");
}
