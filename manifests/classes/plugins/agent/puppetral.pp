# Class: mcollective::plugins::agent::puppetral
#
#
class mcollective::plugins::agent::puppetral {
	mcollective::plugin { "puppetral":
		ensure => present,
		type   => "agent"
	}
}
