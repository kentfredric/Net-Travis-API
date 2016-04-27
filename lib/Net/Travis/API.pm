use 5.006;    # our
use strict;
use warnings;

package Net::Travis::API;

our $VERSION = '0.002000';

# ABSTRACT: Low Level Plumbing for travis-ci.org's api

# AUTHORITY

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"Net::Travis::API",
    "interface":"class",
    "inherits":"Moo::Object"
}

=end MetaPOD::JSON

=cut

=head1 DEVELOPMENT

This code is highly in-development, and is feature incomplete, and does not presently represent all API functions available.

At present, most the functionality is lower-level plumbing functions which should eventually give way to a higher level API.

But code endeavors to approach better coverage eventually, and hopefully serve as a better documentation than Travis's own API
docs, which were so lackluster I had to resort to sniffing their websites traffic from my browser to understand what was going
on.

=cut

=head1 AUTHENTICATION

Presently this module only covers the overhead of getting authentication working with travis, so that you can do arbitrary
requests and get useful responses.

And this was the #1 challenge from the Travis API docs, because this process is poorly documented, and fettered with
documentation about things documented not to be implemented yet.

So, at present, you have several options:

=over 4

=item 1. Work with an unauthenticated User Agent.

    use Net::Travis::API::UA;

    my $ua = Net::Travis::API::UA->new();

    $ua->get('/repos/someuser'); # Public Endpoint

=item 2. Use the GitHub Authentication Module to get an authenticated agent.

    use Net::Travis::API::Auth::GitHub;

    my $ua = Net::Travis::API::Auth::GitHub->get_authorised_ua_for( $token );

    $ua->get('/users'); # private endpoint

=item 3. Get an authorization token some other way.

And avoid incurring an authorization request overhead.

    use Net::Travis::API::UA;

    my $ua = Net::Travis::API::UA->new(
        authtokens => [ $token ]
    );

    $ua->get('/users'); # private endpoint

=back

=cut

use Moo;

no Moo;

1;
