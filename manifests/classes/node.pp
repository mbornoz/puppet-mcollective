# Class: mcollective::node
#
#
class mcollective::node inherits mcollective {
	case $operatingsystem {
        /(?i)(ubuntu|debian|redhat|centos)/: {
			include mcollective::common
			include mcollective::node::install
			include mcollective::node::config
			include mcollective::node::service
			include "mcollective::plugins::connector::${mcollective_connector}::node"
			include "mcollective::plugins::security::${mcollective_securityprovider}::node"
			include mcollective::plugins::standard
		}
        default: { notice("${hostname}: mcollective module does not support ${operatingsystem} yet") }
    }
}
