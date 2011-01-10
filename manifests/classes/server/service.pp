# Class: mcollective::server::service
#
#
class mcollective::server::service {
	service { mcollective:
		ensure     => running,
		enable     => true,
		hasrestart => true,
		hasstatus  => true,
		require    => [ Class["mcollective::common"], Class["mcollective::server::config"] ]
	}
}