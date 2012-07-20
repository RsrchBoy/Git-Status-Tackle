package Git::Status::Tackle::Remotes;

use strict;
use warnings;

use parent 'Git::Status::Tackle::Plugin';

sub synopsis { 'Lists our remotes' }

sub list { [ `git remote -v` ] }

!!42;
