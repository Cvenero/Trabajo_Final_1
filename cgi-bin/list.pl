#!/usr/bin/perl
use strict;
use warnings;
use DBI;
my $user='alumno';
my $password='pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.1.9";
my $dbh = DBI->connect($dsn,$user,$password) or die("No se pudo conectar!");;

my $sth = $dbh->prepare(SELECT Title FROM Wiki);

while(my @row = $sth->fetchrow_array){
  print "@row\n";
}
$dbh->disconnect;
