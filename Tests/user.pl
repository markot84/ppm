use strict;
use Data::Dumper();
use App::Locpush::User();
use App::Locpush::Constants();
use App::Locpush::Application();
use App::Locpush::Devices();

#my @chars = ('0'..'9','a'..'z','A'..'Z','!','@','#','$','%','^','&','*','(',')','+','{','}','[',']',';','"','|','<','>','/');
#print $chars[rand @chars]for 1..15;
#print "\n";

my $User = new App::Locpush::User();
my $Application = new App::Locpush::Application();
my $Device = new App::Locpush::Devices();

warn $Device->create_secret(16);

#print $User->create_secret();

#my $json = $User->register(
#        fields  =>  {
#                        username    =>  'gkats@arx.gr',
#                        password    =>  '12345678',
#                        client_id   =>  $User->encrypt('1')
#        },
#        format  =>  App::Locpush::Constants::FORMAT_PERL()
#);
#my $json = $User->login(username=>'giorgos.sfitis@arx.gr',password=>'12345678',format=>App::Locpush::Constants::FORMAT_PERL());
#my $json = $Device->get(args=>{id=>$Device->encrypt('3')},format=>App::Locpush::Constants::FORMAT_PERL());
#warn Data::Dumper::Dumper($json);

#print Data::Dumper::Dumper($json);

#warn "Testing 1 & 1: ";
#warn 1 & 512;
#warn "Testing 1 & 1: ";
#warn 2 & 512;
#warn "Testing 1 & 1: ";
#warn 4 & 512;
#warn "Testing 1 & 1: ";
#warn 8 & 512;
#warn "Testing 1 & 1: ";
#warn 16 & 512;
#warn "Testing 1 & 1: ";
#warn 32 & 512;
#warn "Testing 1 & 1: ";
#warn 64 & 512;
#warn "Testing 1 & 1: ";
#warn 128 & 512;
#warn "Testing 1 & 1: ";
#warn 256 & 512;
#warn "------------";
#warn $User->get_su_role();
