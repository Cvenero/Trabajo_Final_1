#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;

my $q=CGI->new;
my $user='alumno';
my $password='pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.1.9";
my $dbh = DBI->connect($dsn,$user,$password) or die("No se pudo conectar!");;
#view.pl
#my $titulo = 'Titulo4';
my $tt= $q->param('fn');
print $q->header('text/html');
my $sth = $dbh->prepare("SELECT Text FROM Wiki WHERE Title=?");

$sth->execute($tt);
print "<a href='list.pl'>Regresar al listado</a>";
#EXPRESIONES REGULARES PARA TRADUCIR A HTML
if(my @row = $sth->fetchrow_array){
  my $txt = $row[0];
  print "<h1>$tt</h1>";
  if($txt =~ /^\#{1}\s.*/){
    print "<h1>$txt</h1>";
  }
  if($txt =~/^\#{2}\s.*/){
    print "<h2>$txt</h2>";
  }
  if($txt =~/^\#{6}\s.*/){
    print "<h6>$txt</h6>";
  }
  else{
    print "<p>@row</p>\n";
  }
}
  $sth->finish;
  $dbh->disconnect;

print <<BLOCK
<!DOCTYPE html>
<html>
<head>
<title> Lista </title>
</head>
<body>
</body>
</html>
BLOCK
