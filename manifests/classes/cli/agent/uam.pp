# Class: mcollective::cli::agent::uam
#
#
class mcollective::cli::agent::uam inherits mcollective::cli::base {
	mcollective::plugin::cli { "uam":
		ensure => present,
		type   => agent,
		repo   => "jofu"
	}
}
