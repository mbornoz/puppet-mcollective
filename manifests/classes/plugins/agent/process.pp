# Class: mcollective::plugins::agent::process
#
#
class mcollective::plugins::agent::process {
	include ruby::sys_proctable
	
	mcollective::plugin { "process":
		ensure => present,
		type   => "agent"
	}
}
