package Git::Status::Tackle::Remotes;

use strict;
use warnings;

use parent 'Git::Status::Tackle::Plugin';

use Term::ANSIColor ':constants';

sub synopsis { 'Lists our remotes' }

sub list {
    my ($self) = @_;

    my %remotes =
        map  { /^(\w+)\s+(\S+)/; $1 => $2 }
        grep { /\(fetch\)/                }
        `git remote -v`
        ;

    ### calculate how long the longest remote name is...
    my $name_length = length 'origin'; # good a place as any to start
    $name_length = length $_ > $name_length ? length $_ : $name_length
        for keys %remotes;

    ### and create our sprintf() template...
    my $template = "  %-${name_length}s ";

    return [
        map { "$_\n" }
        map { WHITE . sprintf($template, $_) . RESET . YELLOW . $remotes{$_} . RESET }
        sort keys %remotes
    ];
}

!!42;
