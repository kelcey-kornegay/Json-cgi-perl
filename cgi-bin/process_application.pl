#!/usr/bin/perl  -w
use DBI;
use JSON;
use CGI;
#definition of variables

my $q = CGI->new;
my $date = $q->param('DATE');
my $time = $q->param('SelectTime');
my $desc = $q->param('DESC');
my $process = $q->param('process');




my $db="demo";
my $host="localhost";
my $user="****";
my $password="*****";

my $dbh   = DBI->connect ("DBI:mysql:database=$db:host=$host",
                          $user,
                          $password) 
                          or die "Can't connect to database: $DBI::errstr\n";

						  
if($process){
    
	my $sth1  = $dbh->prepare("insert into appointment (date,description,time) values ('$date','$desc','$time')");
	$sth1->execute();
	$sth1->finish();
	
	
	#print $q->end_html;
    print $q->redirect('http://localhost/demo/index.html');

}else{
 print $q->redirect('http://localhost/demo/index.html');
 

 
}



exit;