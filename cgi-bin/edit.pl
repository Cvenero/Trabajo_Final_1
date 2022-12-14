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
#edit.pl
#my $titulo = 'Titulo4';
my $titulo = $q->param('titulo');
print $q->header('text/html');
my $sth = $dbh->prepare("SELECT Text FROM Wiki WHERE Title=?");

$sth->execute($titulo);
print "<a href='list.pl'>Regresar al listado</a>";
if(my @row = $sth->fetchrow_array){
  print "<h1>Titulo:</h1>";
  print "<p>@row</p>\n";
}
  $sth->finish;
  $dbh->disconnect;

print <<BLOCK
<!DOCTYPE html>
<html>
<head>
<title> Listado </title>
</head>
<body>
</body>
</html>
BLOCK
