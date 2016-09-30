#!/usr/bin/perl

use strict;
use Data::Dumper();
use Net::XMPP();
use JSON();
use XML::LibXML();

my $configuration = {
    #google firebase configuration
    ccs_fcm_endpoint		=>	'fcm-xmpp.googleapis.com',
    ccs_fcm_production_poty	=>	5235,
    ccs_fcm_preProduction	=>	5236,
    ccs_hostname			=>	'gcm.googleapis.com',
    ccs_namespace			=>	'jabber:client',
    #firebase application account
    server_key				=>	'AIzaSyDdX1uv_sPGSUHvOO0SQwkRpVZ1WnuZ5wY',
    sender_id				=>	'998915164374',
    device_secret			=>	'foteXiN5aBg:APA91bHhxmDjdYV8jHmSOSQvsqtXtzaetKNop84GW_BBZiRv9LDfX4g_MA50lbpDCEgST61tzb0O-6A335L1Z5ql9MUl8vqLj-hFAAgYfZEZMlpVddQBCZJTbiDT8TbIIS6A-Qa44I62',
    #ssl
    connection_type			=>	'tcpip',
    _tls					=>	1,
    ssl						=>	1,
    ssl_ca_path				=>	'/etc/ssl/certs/',
};
#create a new xmpp client
my $connection = Net::XMPP::Client->new();

$connection->SetCallBacks(
    send    	=>  \&sendCallBack,
    receive		=>  \&receiveCallBack,
    onconnect   =>  \&onConnect,
    onprocess   =>  \&onProcess
);

$connection->Connect(
    hostname		=>	$configuration->{ccs_hostname},
    port			=>	$configuration->{ccs_fcm_preProduction},
    namespace       =>  $configuration->{ccs_namespace},
    connection_type	=>	$configuration->{connection_type},
    _tls            =>	$configuration->{_tls},
    ssl_ca_path		=>	$configuration->{ssl_ca_path},
    ssl             =>  $configuration->{ssl}
);

if ($connection->Connected()) {

    my @result = $connection->AuthSend(
        username => $configuration->{sender_id},
        password => $configuration->{server_key}
    );
    die ("Authorization failed") if @result[0] ne "ok";

    #remember payload must be max 4KB
    my $payload = {
        to              	=>  $configuration->{device_secret},
        message_id      	=>  "m-$connection->{SESSION}->{id}",
        notification    	=>  {
            title   =>  "Geia sou",
            body    =>  "Elena"
        },
        data				=>  {
            hello  =>  "thomatou",
        },
        #wake up application if not running
        content_available			=>  JSON::true,
        time_to_live    			=>  600,
        #ask firebase for delivery information
        delivery_receipt_requested	=> JSON::true
    };
    my $messageBody =   qq[<gcm xmlns="google:mobile:data">].JSON::to_json($payload).qq[</gcm>];
    $connection->Send(qq[<message id="">$messageBody</message>]);
    while(1){
        $connection->Process();
    }
    #warn Data::Dumper::Dumper($connection);
} else {
    die("ERROR: XMPP connection failed $!");
}

sub sendCallBack {
    my $id = shift;
    my $send_xml = shift;
    warn "------------------------------------------------------";
    warn "send";
    warn $id;
    warn $send_xml;
    warn "------------------------------------------------------";
}
sub receiveCallBack {
    my ($mID,$mReceived) = @_;
    warn "######################################################";
    warn "received";
    warn $mReceived;
    my $parser = XML::LibXML->new();
    my $tree;
    eval q|$tree = $parser->parse_string( $mReceived );|;
    my $root = $tree->documentElement();
    warn Data::Dumper::Dumper($tree);
    warn Data::Dumper::Dumper($root);

    if ($root->hasChildNodes()) {

    }


    warn "######################################################";
}
sub onConnect {
    warn "######################################################";
    warn "######################################################";
}sub onProcess {
    warn "######################################################";
    warn @_;
    warn "######################################################";
}
