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
#new.pl
my $titulo_insertar = $q->param('title');
my $texto_insertar = $q->param('text');
print $q->header('text/html');
my $sth = $dbh->prepare("INSERT INTO Wiki(Title, Text) VALUES(?,?)");
$sth->execute($titulo_insertar,$texto_insertar);
print "<h1>$titulo_insertar</h1>";
print "<p>$texto_insertar</p>";
print "<br>";
print "<h2>Pagina grabada <a href='list.pl'>Listado de Paginas</a></h2>";

$sth->finish;
$dbh->disconnect;
