# Class: mcollective::plugins::base
#
#
class mcollective::plugins::base inherits mcollective {
	File {
		require => [ Class["mcollective::common"] ],
		owner   => root,
		group   => root,
		notify  => Class["mcollective::server::service"]
	}
}
