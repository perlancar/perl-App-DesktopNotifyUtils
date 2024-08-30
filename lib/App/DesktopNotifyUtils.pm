package App::DesktopOpenUtils;

use 5.010001;
use strict;
use warnings;
use Log::ger;

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

$SPEC{desktop_notify} = {
    v => 1.1,
    summary => 'Show a notification on your desktop',
    description => <<'MARKDOWN',

Currently a very simple interface to <pm:Desktop::Notify>. Will offer more
options in the future.

MARKDOWN
    args => {
        summary => {
            schema => 'str*',
            req => 1,
            pos => 0,
        },
        body => {
            schema => 'str*',
            pos => 1,
        },
        timeout => {
            summary => 'Timeout, in ms',
            schema => 'uint*',
            default => 5000,
        },
    },
};
sub desktop_notify {
    require Desktop::Notify;

    my %args = @_;
    my $notify = Desktop::Notify->new;

    my $notification = $notify->create(
        summary => $args{summary},
        body => $args{body},
        timeout => $args{timeout} // 5000,
    );
    $notification->show;

    [200];
}

1;
# ABSTRACT: Utilities related to Desktop::Notify

=head1 SYNOPSIS


=head1 DESCRIPTION

This distribution includes several utilities:

#INSERT_EXECS_LIST


=head1 SEE ALSO

L<Desktop::Notify>
