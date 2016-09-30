#!/usr/bin/perl

use strict;
use Data::Dumper();
use Net::XMPP();

use App::Locpush::User();
use App::Locpush::Constants();

my $ccsXMPP_endpoint			= "dukgo.com";

#create a new client object
my $connection = new Net::XMPP::Client(
debuglevel	=>	5,
                                    debugfile	=>	"stdout",
                                    debugtime	=>	1);

my $status = $connection->Connect(
                                hostname		=>	'dukgo.com',
                                username		=>	'markot84',
								password		=>	'567666',
								connection_type	=>	'tcpip',
								tls            =>	1,
                                ssl_ca_path		=>	'/etc/ssl/certs/',
);

warn $connection->Connected();

my @result = $connection->AuthSend(
                            resource => 'Home',
							hostname =>	'dukgo.com',
							username => 'markot84',
							password => '567666'
);
warn Data::Dumper::Dumper(@result);

warn $connection->MessageSend(
    to => 'markot85@dukgo.com',
    resource => 'Home',
    subject => 'message via ',
    type => 'chat',
    body => 'ela re megale',
    delivery_receipt_requested => 'true'
);