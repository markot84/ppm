#!/usr/bin/perl
use XML::LibXML();
use JSON();

my $xml = qq[<message id=""><gcm xmlns="google:mobile:data">{"notification":{"title":"Geia sou","body":"Elena"},"content_available":true,"delivery_receipt_requested":true,"to":"foteXiN5aBg:APA91bHhxmDjdYV8jHmSOSQvsqtXtzaetKNop84GW_BBZiRv9LDfX4g_MA50lbpDCEgST61tzb0O-6A335L1Z5ql9MUl8vqLj-hFAAgYfZEZMlpVddQBCZJTbiDT8TbIIS6A-Qa44I62","time_to_live":600,"data":{"hello":"thomatou"},"message_id":"m-F50F9319CA519934"}</gcm></message>];

my $parser = XML::LibXML->new();
my $tree;
my $data = {};
eval q|$tree = $parser->parse_string( $xml );|;
if (!$@) {
    my $root = $tree->documentElement();
    $root->nodeName eq 'message' and  parseXML($root,$data);
    warn Data::Dumper::Dumper($data);
}


sub parseXML {
    my $root = shift;
    my $data = shift;

    if (has_child_nodes($root)) {
        $data->{$root->nodeName} = {
            nodes   =>  get_child_nodes($root),
            attrs   =>  get_node_attrs($root)
        };
        foreach my $node (@{$data->{$root->nodeName}->{nodes}}) {
            parseXML($node,$data->{$root->nodeName});
        }
    } else {
        $data->{payload} = parseData($root->textContent);
    }
}
sub has_child_nodes {
    my $root = shift;
    my $nodes = 0;
    foreach my $node ($root->childNodes) {
        $nodes++;
    }
    return $nodes
}
sub get_child_nodes {
    my $root = shift;
    my $nodes = [];
    foreach my $node ($root->childNodes) {
        push @{$nodes}, $node;
    }
    return $nodes;
}
sub get_node_attrs {
    my $root = shift;
    my $attrs = {};

    foreach my $attr ( $root->attributes() ) {
        $attrs->{$attr->name} = $attr->value;
    }
    return $attrs;
}
sub parseData {
    my $data = shift;
    return JSON::from_json($data);
}