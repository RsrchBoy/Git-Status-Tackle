package Git::Status::Tackle::UntrackedFiles;
use strict;
use warnings;

sub list {
    my $untracked_files = `git ls-files -z --exclude-standard --directory --others --full-name`;
    return {
        output => [map { " $_\n" } split "\0", $untracked_files],
    };
}

1;

