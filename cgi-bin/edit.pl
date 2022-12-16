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
my $tt= $q->param('fn');
print $q->header('text/html');
my $sth = $dbh->prepare("SELECT Text FROM Wiki WHERE Title=?");
##my $sth = $dbh->prepare("UPDATE Wiki SET Text=? WHERE Title=?");

$sth->execute($tt);
my @row = ($sth->fetchrow_array);
my $txt = $row[0];
print "<h1>$tt</h1>";
print "<form action='' method='GET'>
<div>
<label for='text'>Texto</label>
<textarea name='text'rows='25' cols='60' value=$txt>$txt</textarea>
</div>
<input type='submit' value='Enviar'>
</form>";
print "<a href='list.pl'>Cancelar</a>";

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
