#!/usr/bin/perl
use strict;
use warnings;

use Path::Class;
use autodie;
use Cwd;

if( not defined $ARGV[0] ) {
    print "Please give the name of the file to create!\n";
    exit;
}

my $dir = dir(getcwd);
my $file = $dir->file($ARGV[0]);

my $file_handle = $file->openw();

my @license;
if( defined $ARGV[1] && $ARGV[1] eq "AGPL" ) {
    @license = ('',
                'This program is free software: you can redistribute it and/or modify',
                'it under the terms of the GNU Affero General Public License as published by',
                'the Free Software Foundation, either version 3 of the License, or',
                'any later version.',
                '',
                'This program is distributed in the hope that it will be useful,',
                'but WITHOUT ANY WARRANTY; without even the implied warranty of',
                'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the',
                'GNU Affero General Public License for more details.',
                '',
                'You should have received a copy of the GNU Affero General Public License',
                'along with this program.  If not, see <http://www.gnu.org/licenses/>.');
}
elsif( defined $ARGV[1] && $ARGV[1] eq "GPL3" ) {
    @license = ('',
                'This program is free software: you can redistribute it and/or modify',
                'it under the terms of the GNU General Public License as published by',
                'the Free Software Foundation, either version 3 of the License, or',
                'any later version.',
                '',
                'This program is distributed in the hope that it will be useful,',
                'but WITHOUT ANY WARRANTY; without even the implied warranty of',
                'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the',
                'GNU Affero General Public License for more details.',
                '',
                'You should have received a copy of the GNU Affero General Public License',
                'along with this program.  If not, see <http://www.gnu.org/licenses/>.');
}

my @list = ('{- |',
            'Module:        $file',
            'Description:   <Description>',
            'Copyright:     (c) <Authors>',
            'License:       <License>',
            'Author:        <Author>',
            'Maintainer:    <email>',
            '',
            '<module description starting at first column>',
            '',
            'Copyright (C) <Year>    <Author>');

my @end = ('-}');
if( scalar(@license) > 0 ) {
    @list = (@list, @license);
}

@list = (@list, @end);

foreach my $line ( @list ) {
    $file_handle->print($line. "\n");
}
