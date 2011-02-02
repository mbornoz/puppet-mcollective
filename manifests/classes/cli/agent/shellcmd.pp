# Class: mcollective::cli::agent::shellcmd
#
#
class mcollective::cli::agent::shellcmd inherits mcollective::cli::base {
	mcollective::plugin::cli { "shellcmd":
		ensure => present,
		type   => agent,
		repo   => "joemiller"
	}
}
