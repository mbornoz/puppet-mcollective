import "classes/*.pp"
import "classes/cli/*.pp"
import "classes/cli/agent/*.pp"
import "classes/cli/util/*.pp"
import "classes/client/*.pp"
import "classes/mongodb/*.pp"
import "classes/node/*.pp"
import "classes/plugins/*.pp"
import "classes/plugins/agent/*.pp"
import "classes/plugins/agent/registration/*.pp"
import "classes/plugins/connector/*.pp"
import "classes/plugins/connector/stomp/*.pp"
import "classes/plugins/facts/*.pp"
import "classes/plugins/registration/*.pp"
import "classes/plugins/security/*.pp"
import "classes/plugins/security/none/*.pp"
import "classes/plugins/security/psk/*.pp"
import "classes/plugins/security/sshkey/*.pp"
import "definitions/*.pp"
import "definitions/plugin/*.pp"

# Class: mcollective
#
# This module manages mcollective
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class mcollective {
	include mcollective::params
	
	warning("mcollective mode is ${mcollective::params::mode}")
	
	case $mcollective::params::mode {
		"client": {
			include mcollective::client
		}
		"both": {
			include mcollective::node
			include mcollective::client
		}
		default: {
			include mcollective::node
		}
	}
}
