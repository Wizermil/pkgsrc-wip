#!/bin/sh
#
# $NetBSD: nagios.sh,v 1.1 2005/08/03 20:14:21 scott8586 Exp $
#
# PROVIDE: nagios
# REQUIRE: DAEMON

if [ -f /etc/rc.subr ]; then
	. /etc/rc.subr
fi

name="nagios"
rcvar=$name
command="@PREFIX@/bin/${name}"
pidfile="/var/run/${name}/${name}.lock"
config="@PKG_SYSCONFDIR@/${name}.cfg"

command_args="-d $config"
 
test_cmd="nagios_test"
extra_commands="test"

nagios_test()
{
	$command -v $config
}

load_rc_config $name
run_rc_command "$1"
