# Class: mcollective::cli::agent::uam
#
#
class mcollective::cli::agent::uam {
	mcollective::plugin::cli { "uam":
		ensure => present,
		type   => agent,
		repo   => "jofu"
	}
}
