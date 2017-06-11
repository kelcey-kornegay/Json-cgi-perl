#!/usr/bin/perl  -w
use DBI;
#use strict;
use warnings;
use CGI;
use JSON;
use Template;

my $q = new CGI;
my %data;


#definition of variables
$db="demo";
$host="localhost";
$user="******";
$password="*****";
$search = $q->param('search');
#connect to MySQL database
my $dbh   = DBI->connect ("DBI:mysql:database=$db:host=$host",
                          $user,
                          $password) 
                          or die "Can't connect to database: $DBI::errstr\n";


my $sth = $dbh->prepare( "SELECT id,date,time,description FROM appointment where description like ?");
$sth->execute('%'.$search.'%');


#execute the query
$sth->execute( );
## Retrieve the results of a row of data and print

my @query_output;

while ( my $row = $sth->fetchrow_hashref ){
push @query_output, $row;
}

print $q->header('application/json;charset=UTF-8');
# print the json output to be returned to the HTML page
print JSON::to_json(\@query_output);


exit;