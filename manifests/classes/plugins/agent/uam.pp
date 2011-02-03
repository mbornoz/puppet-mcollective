# Class: mcollective::plugins::agent::uam
#
#
class mcollective::plugins::agent::uam {
	mcollective::plugin { "uam":
		ensure => present,
		type   => "agent",
		repo    => "jofu"
	}
}
