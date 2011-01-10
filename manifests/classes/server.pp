# Class: mcollective::server
#
#
class mcollective::server inherits mcollective {
	case $operatingsystem {
        /(?i)(ubuntu|debian|redhat|centos)/: {
			include mcollective::common
			include mcollective::server::install
			include mcollective::server::config
			include mcollective::server::service
			include "mcollective::plugins::connector::${mcollective_connector}"
			include "mcollective::plugins::security::${mcollective_securityprovider}"
			include mcollective::plugins::standard
		}
        default: { notice("${hostname}: mcollective module does not support ${operatingsystem} yet") }
    }
}
