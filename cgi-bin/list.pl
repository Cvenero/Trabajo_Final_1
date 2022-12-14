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
  my $E = $row[0];
  print "
  <li><a href='/~alumno/wiki/cgi-bin/view.pl?fn=$row[0]'>$row[0]</a></li>
  <form action='delete.pl' method='GET'>
  <input type='submit' value='X'>
  </form>
  <form action='edit.pl' method='GET'>
  <input type='hidden' name='fn' value=$E>
  <input type='submit' value='E'>
  </form>";
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
