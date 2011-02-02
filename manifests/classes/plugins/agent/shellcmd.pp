# Class: mcollective::plugins::agent::shellcmd
#
#
class mcollective::plugins::agent::shellcmd inherits mcollective::plugins::base {
	mcollective::plugin { "shellcmd":
		ensure => present,
		type   => "agent",
		repo    => "joemiller"
	}
}
