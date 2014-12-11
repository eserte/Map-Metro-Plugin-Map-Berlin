# -*- perl -*-

#
# Author: Slaven Rezic
#
# Copyright (C) 2014 Slaven Rezic. All rights reserved.
# This package is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.
#
# Mail: slaven@rezic.de
# WWW:  http://www.rezic.de/eserte/
#

package Map::Metro::Plugin::Map::Berlin;

use strict;
use vars qw($VERSION);
$VERSION = '0.01';

use Moose::Role;

use File::ShareDir 'dist_dir';
use Path::Tiny;
use Types::Path::Tiny -types;
 
with 'Map::Metro::Plugin::Map';
 
has berlin => (
	       is => 'ro',
	       isa => AbsFile,
	       default => sub { path(dist_dir('Map-Metro-Plugin-Map-Berlin'))->child('map-berlin.metro')->absolute },
	      );

1;

__END__
