# Class: mcollective::client::install
#
#
class mcollective::client::install {
	include repositories::ubuntu::vurbia::main, repositories::ubuntu::puppetlabs::main, repositories::ubuntu::brightbox::main, repositories::ubuntu::brightbox::rubyee
	
	package { mcollective-client:
		ensure => latest,
		require => [ Class["repositories::ubuntu::vurbia::main"], Class["repositories::ubuntu::puppetlabs::main"],
					  Class["repositories::ubuntu::brightbox::main"], Class["repositories::ubuntu::brightbox::rubyee"] ]
	}
	
	include common::packages::dialog
	include ruby::rdialog
	
	# TODO: Split this into subclasses per plugin
	
	# These are the command line utilites from the mcollective-plugins repo
	# file { "/usr/sbin/mc-exim":
	# 		ensure  => present,
	# 		source  => "puppet:///modules/mcollective/plugins/agent/exim/mc-exim",
	# 		mode    => 755
	# 	}
	# 
	# 	file { "/usr/sbin/mc-eximctl":
	# 		ensure  => present,
	# 		source  => "puppet:///modules/mcollective/plugins/agent/exim/mc-eximctl",
	# 		mode    => 755
	# 	}
	
	file { "/usr/sbin/mc-filemgr":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/filemgr/mc-filemgr",
		mode    => 755
	}

	file { "/usr/sbin/mc-iptables":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/iptables-junkfilter/mc-iptables",
		mode    => 755
	}

	file { "/usr/sbin/mc-nrpe":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/nrpe/mc-nrpe",
		mode    => 755
	}

	file { "/usr/sbin/mc-package":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/package/mc-package",
		mode    => 755
	}

	file { "/usr/sbin/mc-puppetd":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/puppetd/mc-puppetd",
		mode    => 755
	}

	file { "/usr/sbin/mc-service":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/service/mc-service",
		mode    => 755
	}	

	file { "/usr/sbin/mc-ssh":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/utilities/mc-ssh/mc-ssh",
		mode    => 755
	}

	# file { "/usr/sbin/mc-urltest":
	# 		ensure  => present,
	# 		source  => "puppet:///modules/mcollective/plugins/agent/urltest/mc-urltest",
	# 		mode    => 755
	# 	}
}
