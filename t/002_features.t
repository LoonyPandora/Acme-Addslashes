use Test::More tests => 3;

use strict;
use warnings;
use utf8;
use feature qw(unicode_strings);

use Acme::Addslashes qw(addslashes);
use Encode qw(decode);


ok(decode("utf8", addslashes q{Moose}) eq q{M̷o̷o̷s̷e̷}, 'Latin text slashed up');

ok(decode("utf8", addslashes q{💩}) eq q{💩̷}, 'Slashed up a Pile of Poo');

ok(decode("utf8", addslashes q{Robert'); DROP TABLE Students;--}) eq q{R̷o̷b̷e̷r̷t̷'̷)̷;̷ ̷D̷R̷O̷P̷ ̷T̷A̷B̷L̷E̷ ̷S̷t̷u̷d̷e̷n̷t̷s̷;̷-̷-̷}, 'Slash up little Bobby Tables');
