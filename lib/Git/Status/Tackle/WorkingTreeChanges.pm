package Git::Status::Tackle::WorkingTreeChanges;
use strict;
use warnings;
use parent 'Git::Status::Tackle::Component';

sub list {
    return {
        output => [`git diff --color --stat`],
    };
}

1;

