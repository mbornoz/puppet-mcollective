# Class: mcollective::cli::agent::shellcmd
#
#
class mcollective::cli::agent::shellcmd {
	mcollective::plugin::cli { "shellcmd":
		ensure => present,
		type   => agent,
		repo   => "joemiller"
	}
}
