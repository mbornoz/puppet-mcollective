# Class: mcollective::plugins::base
#
#
class mcollective::plugins::base inherits mcollective {
	Mcollective::Plugin {
		require => [ Class["mcollective::common"] ],
		notify  => Class["mcollective::node::service"]
	}
}
