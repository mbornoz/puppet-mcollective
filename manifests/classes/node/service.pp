# Class: mcollective::node::service
#
#
class mcollective::node::service {
	service { mcollective:
		ensure     => running,
		enable     => true,
		hasrestart => true,
		hasstatus  => true,
		require    => [ Class["mcollective::common"], Class["mcollective::node::config"] ]
	}
}
