# Class: mcollective::params
#
#
class mcollective::params {
	case $operatingsystem {
		/(?i)(Ubuntu)/: {
			$plugin_dir      = "/usr/share/mcollective/plugins"
			$ruby_puppet_dir = "/usr/lib/ruby/1.8/puppet"
			$pkg_deps = [ Class["apt"], Class["apt::repo::puppetlabs::main"] ]
			include apt, apt::repo::puppetlabs::main
		}
		/(?i)(Debian)/: {
			$plugin_dir      = "/usr/share/mcollective/plugins"
			$ruby_puppet_dir = "/usr/lib/ruby/1.8/puppet"
			$pkg_deps = [ Class["apt"], Class["apt::backports"], Class["apt::repo::puppetlabs::main"] ]
			include apt, apt::backports, apt::repo::puppetlabs::main
		}
		/(?i)(Redhat|CentOS)/: {
			$plugin_dir      = "/usr/libexec/mcollective"
			$ruby_puppet_dir = "/usr/lib/ruby/site_ruby/1.8/puppet"
			$pkg_deps = [ Class["yum"], Class["yum::repo::puppetlabs::base"], Class["yum::repo::epel::main"] ]
			include yum, yum::repo::puppetlabs::base, yum::repo::epel::main
		}
		default: {
			fail "Unsupported OS ${operatingsystem} in 'puppet' module"
		}
    }

	$conf_dir         = "/etc/mcollective"
	$agent_dir        = "${plugin_dir}/mcollective/agent"
	$audit_dir        = "${plugin_dir}/mcollective/audit"
	$connector_dir    = "${plugin_dir}/mcollective/connector"
	$facts_dir        = "${plugin_dir}/mcollective/facts"
	$registration_dir = "${plugin_dir}/mcollective/registration"
	$security_dir     = "${plugin_dir}/mcollective/security"
	$util_dir         = "${plugin_dir}/mcollective/util"
	
	# Mode: node, client or both
	$mode = $mcollective_mode ? {
		"node"   => "node",
		"client" => "client",
		"both"   => "both",
		default  => "node"
	}
	
	# Topic prefix
	$topicprefix = $mcollective_topicprefix ? {
		""      => "/topic/mcollective",
		default => $mcollective_topicprefix
	}
	
	# Connector to use. Default is stomp
	$connector = $mcollective_connector ? {
		""      => "stomp",
		default => $mcollective_connector
	}
	
	$securityprovider = $mcollective_securityprovider ? {
		"psk"    => "psk",
		"none"   => "none",
		"sshkey" => "sshkey",
		default  => "psk"
	}
	
	$factsource = $mcollective_factsource ? {
		"yaml"   => "yaml",
		"facter" => "facter",
		default  => "yaml"
	}
	
	$registration = $mcollective_registration ? {
		"true"  => true,
		"false" => false,
		default => false
	}
	
	$node_daemonize = $mcollective_node_daemonize ? {
		"true"  => "1",
		"false" => "0",
		default => "1"
	}
	
	$node_logfile = $mcollective_node_logfile ? {
		""      => "/var/log/mcollective.log",
		default => $mcollective_node_logfile
	}
	
	$node_loglevel = $mcollective_node_loglevel ? {
		""      => "info",
		default => $mcollective_node_loglevel
	}
	
	$node_keeplogs = $mcollective_node_keeplogs ? {
		"true"  => "1",
		"false" => "0",
		default => "1"
	}
	
	$node_max_log_size = $mcollective_node_max_log_size ? {
		""      => "10240",
		default => $mcollective_node_max_log_size
	}
	
	$client_logfile = $mcollective_client_logfile ? {
		""      => "/dev/null",
		default => $mcollective_client_logfile
	}
	
	$client_loglevel = $mcollective_client_loglevel ? {
		""      => "info",
		default => $mcollective_client_loglevel
	}
	
	# Puppetd agent plugin
	$classesfile = $mcollective_classesfile ? {
		""      => "/var/lib/puppet/state/classes.txt",
		default => $mcollective_classesfile
	}
	
	$puppetd_puppetd = $mcollective_puppetd_puppetd ? {
		""      => "/usr/sbin/puppetd",
		default => $mcollective_puppetd_puppetd
	}
	
	$puppetd_lockfile = $mcollective_puppetd_lockfile ? {
		""      => "/var/lib/puppet/state/puppetdlock",
		default => $mcollective_puppetd_lockfile
	}
	
	$puppetd_statefile = $mcollective_puppetd_statefile ? {
		""      => "/var/lib/puppet/state/state.yaml",
		default => $mcollective_puppetd_statefile
	}
	
	$puppetd_splaytime = $mcollective_puppetd_splaytime ? {
		""      => "100",
		default => $mcollective_puppetd_splaytime
	}
	
	# VCSmgr agent plugin
	$vcsmgr_svn = $mcollective_vcsmgr_svn ? {
		""      => "/usr/bin/svn",
		default => $mcollective_vcsmgr_svn
	}
	
	# Spamassassin agent plugin
	$spamassassin_compiled_ruleset = $mcollective_spamassassin_compiled_ruleset ? {
		""      => "/var/lib/spamassassin/compiled/5.008/3.002005/Mail/SpamAssassin/CompiledRegexps/body_0.pm",
		default => $mcollective_spamassassin_compiled_ruleset
	}
	
	# mongoDB registration agent plugin
	$registration_mongohost = $mcollective_registration_mongohost ? {
		""      => "localhost",
		default => $mcollective_registration_mongohost
	}
	
	$registration_mongodb = $mcollective_registration_mongodb ? {
		""      => "puppet",
		default => $mcollective_registration_mongodb
	}
	
	$registration_collection = $mcollective_registration_collection ? {
		""      => "nodes",
		default => $mcollective_registration_collection
	}
	
	# Stomp connector plugin
	$stomp_host = $mcollective_stomp_host ? {
		""      => "localhost",
		default => $mcollective_stomp_host
	}
	
	$stomp_port = $mcollective_stomp_port ? {
		""      => "61613",
		default => $mcollective_stomp_port
	}
	
	$stomp_user = $mcollective_stomp_user ? {
		""      => "guest",
		default => $mcollective_stomp_user
	}
	
	$stomp_password = $mcollective_stomp_password ? {
		""      => "guest",
		default => $mcollective_stomp_password
	}
	
	# Version of the ruby stomp gem
	$stomp_version = $mcollective_stomp_version ? {
		""      => "1.1.7",
		default => $mcollective_stomp_version
	}
	
	# Facter facts plugin
	$facter_facterlib = $mcollective_facter_facterlib ? {
		""      => "/var/lib/puppet/lib/facter:/var/lib/puppet/facts",
		default => $mcollective_facter_facterlib
	}
	
	$fact_cache_time = $mcollective_fact_cache_time ? {
		""      => "300",
		default => $mcollective_fact_cache_time
	}
	
	# Meta registration plugin
	$registerinterval = $mcollective_registerinterval ? {
		""      => "300",
		default => $mcollective_registerinterval
	}
	
	# PSK security plugin
	$psk_password = $mcollective_psk_password ? {
		""      => "defineme",
		default => $mcollective_psk_password
	}
	
	# SSH key security plugin
	$sshkey = $mcollective_sshkey ? {
		""      => "/etc/ssh/ssh_host_rsa_key",
		default => $mcollective_sshkey
	}
}
