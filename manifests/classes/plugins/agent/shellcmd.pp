# Class: mcollective::plugins::agent::shellcmd
#
#
class mcollective::plugins::agent::shellcmd {
	mcollective::plugin { "shellcmd":
		ensure => present,
		type   => "agent",
		repo    => "joemiller"
	}
}
