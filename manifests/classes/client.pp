# Class: mcollective::client
#
#
class mcollective::client inherits mcollective {
	case $operatingsystem {
        /(?i)(ubuntu|debian|redhat|centos)/: {
			include mcollective::common
			include mcollective::client::install
			include mcollective::client::config
			include "mcollective::plugins::connector::${mcollective_connector}"
			include "mcollective::plugins::security::${mcollective_securityprovider}"
		}
        default: { notice("${hostname}: mcollective module does not support ${operatingsystem} yet") }
    }
}
