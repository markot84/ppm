<%
use strict;
use JSON;

$Response->AddHeader("Content-type","application/json; charset=UTF-8");

my $data = {
    name    =>  'marios',
    surname =>  'kotas'
};

print ")]}',\n".JSON::to_json($data);
%>