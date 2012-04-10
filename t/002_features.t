use Test::More tests => 3;

use strict;
use warnings;
use utf8;
use feature qw(unicode_strings);

use Acme::Addslashes qw(addslashes);
use Encode qw(decode);

ok(decode("utf8", addslashes q{Moose}) eq q{M̸o̸o̸s̸e̷}, 'Latin text slashed up');

ok(decode("utf8", addslashes q{}) eq q{̷}, 'Slashed up a Pile of Poo');

ok(decode("utf8", addslashes q{Robert'); DROP TABLE Students;--}) eq q{R̸o̸b̸e̸r̸t̸'̸)̸;̸ ̸D̸R̸O̸P̸ ̸T̸A̸B̸L̸E̸ ̸S̸t̸u̸d̸e̸n̸t̸s̸;̸-̸-̷}, 'Slash up little Bobby Tables');
