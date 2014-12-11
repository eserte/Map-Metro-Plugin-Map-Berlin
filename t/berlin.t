#!/usr/bin/perl -w
# -*- cperl -*-

#
# Author: Slaven Rezic
#

use strict;
use utf8;
use Test::More 'no_plan';

use Map::Metro;

my $graph = Map::Metro->new('Berlin')->parse;
ok $graph, 'parsed Berlin graph';

if (1) { # S-Bahn example
    my $routing = $graph->routes_for('Alexanderplatz', 'Hauptbahnhof');
 
    like $routing->to_text, qr{Alexanderplatz.*Hauptbahnhof};
 
    is $routing->origin_station->name, 'Alexanderplatz';
    is $routing->destination_station->name, 'Hauptbahnhof';
 
    my($best_route) = ($routing->all_routes);
    my @route_stations = $best_route->all_route_stations;
    is join(" ", map { $_->line_station->station->name } @route_stations),
	'Alexanderplatz Hackescher Markt Friedrichstr. Hauptbahnhof';
    like $route_stations[0]->line_station->line->name, qr{^S\d+$};
}

if (0) { # U-Bahn example
    my $routing = $graph->routes_for('Platz der Luftbrücke', 'Gneisenaustr.');
 
    like $routing->to_text, qr{Platz der Luftbrücke.*Gneisenaustr.};
 
    is $routing->origin_station->name, 'Platz der Luftbrücke';
    is $routing->destination_station->name, 'Gneisenaustr.';
 
    my($best_route) = ($routing->all_routes);
    my @route_stations = $best_route->all_route_stations;
    is join(" ", map { $_->line_station->station->name } @route_stations),
	'Platz der Luftbrücke Mehringdamm Gneisenaustr.';
    is $route_stations[0]->line_station->line->name, 'U6';
    is $route_stations[-1]->line_station->line->name, 'U7';
}

__END__
