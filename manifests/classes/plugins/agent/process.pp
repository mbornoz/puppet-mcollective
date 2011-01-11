# Class: mcollective::plugins::process
#
#
class mcollective::plugins::agent::process inherits mcollective::plugins::base {
	include ruby::sys_proctable
	
	mcollective::plugin { "process":
		ensure => present,
		type   => "agent"
	}
}
