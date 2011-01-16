import "classes/*.pp"
import "classes/cli/*.pp"
import "classes/cli/agent/*.pp"
import "classes/cli/util/*.pp"
import "classes/client/*.pp"
import "classes/node/*.pp"
import "classes/plugins/*.pp"
import "classes/plugins/agent/*.pp"
import "classes/plugins/agent/registration/*.pp"
import "classes/plugins/connector/*.pp"
import "classes/plugins/connector/stomp/*.pp"
import "classes/plugins/facts/*.pp"
import "classes/plugins/registration/*.pp"
import "classes/plugins/security/*.pp"
import "classes/plugins/security/psk/*.pp"
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
	$conf_dir         = "/etc/mcollective"
	case $operatingsystem {
        /(?i)(Debian|Ubuntu)/: {
			$plugin_dir = "/usr/share/mcollective/plugins"
			$repo       = "apt::repo::puppetlabs::main"
		}
        /(?i)(Redhat|Centos)/: {
			$plugin_dir = "/usr/libexec/mcollective"
			$repo       = "yum::repo::puppetlabs::base"
		}
		default: {
			fail("${hostname}: mcollective module does not support ${operatingsystem} yet")
		}
    }

	$agent_dir        = "${plugin_dir}/mcollective/agent"
	$audit_dir        = "${plugin_dir}/mcollective/audit"
	$connector_dir    = "${plugin_dir}/mcollective/connector"
	$facts_dir        = "${plugin_dir}/mcollective/facts"
	$registration_dir = "${plugin_dir}/mcollective/registration"
	$security_dir     = "${plugin_dir}/mcollective/security"
	$util_dir         = "${plugin_dir}/mcollective/util"
	
	if ( ! $mcollective_topic_prefix )      { $mcollective_topic_prefix = "/topic/mcollective" }
	if ( ! $mcollective_connector )         { $mcollective_connector = "stomp" }
	if ( ! $mcollective_securityprovider )  { $mcollective_securityprovider = "psk" }
	if ( ! $mcollective_factsource )        { $mcollective_factsource = "yaml" }
	if ( ! $mcollective_registration )      { $mcollective_registration = "false" }
}
