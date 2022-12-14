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
#list.pl
#my $titulo = $q->param("Title");
print $q->header('text/html');
my $sth = $dbh->prepare("SELECT Title FROM Wiki");
$sth->execute();
print "<h1>Listado</h1>\n";
#my @lista;
while(my @row = $sth->fetchrow_array){
  print "<li><a href='view.pl'>$row[0]</a>
  <form action='edit.pl' method='GET'>
  <input type='submit' value='E'>
  <form action='delete.pl' method='GET'>
  <input type='submit' value='X'>
  </form></li>";


  # print "<a href='edit.pl' class = 'botone'>\tE</a>"; #EditarPagina
  #print "<a href='delete.pl'>\tX</a>"; #BorrarPagina
  #print "\n</li>";
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
