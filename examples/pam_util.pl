#!/usr/bin/perl
#
#
#
#PAM_USER = marat
#PAM_TTY = ssh
#PAM_SERVICE = sshd
#PAM_TYPE = auth
#PAM_RHOST = 192.168.100.5

use Data::Dumper;

my $username = '';
my $service = '';
my $type = '';

if(defined($ENV{PAM_USER})) {
    $username = $ENV{PAM_USER};
}
if(defined($ENV{PAM_SERVICE})) {
    $service = $ENV{PAM_SERVICE};
}
if(defined($ENV{PAM_TYPE})) {
    $type = $ENV{PAM_TYPE};
}

#test 
#$username = "marat2";
my $homedir = "/home/".$username;
my $shell = "/bin/bash";

# Проверяем зарегистрирован ли пользователь в /etc/passwd
my $adduser = 1;
open (PASS, "/etc/passwd");
while(<PASS>) {
    my $str = $_;
    my (@a) = split /:/,$str;
#print Dumper(\@a);
    if ($a[0] eq $username) {
	print $str;
	$adduser = 0;
    }
}
close PASS;
# Проверяем зарегистрирована ли группа в /etc/group
my $addgroup = 1;
open (GRP, "/etc/group");
while(<GRP>) {
    my $str = $_;
    my (@a) = split /:/,$str;
    if ($a[0] eq $username) {
	print $str;
	$addgroup = 0;
    }
}
close GRP;

if($addgroup) {
# Группы нет - создаем
    system("/usr/sbin/groupadd", "-f",$username);
}

if($adduser) {
# Пользователь не зарегистрирован - создаем пользователя
    system("/usr/sbin/useradd", "-g",$username,"-s", $shell,"-d",$homedir,$username);
}

# Проверяем наличие homedir
#if (not -d $homedir) {
#    mkdir $homedir;
#    system ("/bin/chown","-R",$username.":".$username, $homedir);
#}
