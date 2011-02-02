# Class: mcollective::plugins::agent::uam
#
#
class mcollective::plugins::agent::uam inherits mcollective::plugins::base {
	mcollective::plugin { "uam":
		ensure => present,
		type   => "agent",
		repo    => "jofu"
	}
}
