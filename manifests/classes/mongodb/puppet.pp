# Class: mcollective::puppet
#
#
class mcollective::mongodb::puppet {
	File {
		owner => root,
		group => root,
		mode  => 644
	}
	
	file { "${mcollective::params::ruby_puppet_dir}/util/mongoquery.rb":
		ensure => present,
		source => "puppet:///modules/mcollective/plugins/puppetlabs/agent/registration-mongodb/puppet/mongoquery.rb"
	}
	
	file { "${mcollective::params::ruby_puppet_dir}/parser/functions/load_node.rb":
		ensure => present,
		source => "puppet:///modules/mcollective/plugins/puppetlabs/agent/registration-mongodb/puppet/load_node.rb"
	}
	
	file { "${mcollective::params::ruby_puppet_dir}/parser/functions/search_nodes.rb":
		ensure => present,
		source => "puppet:///modules/mcollective/plugins/puppetlabs/agent/registration-mongodb/puppet/search_nodes.rb"
	}
	
	file { "${mcollective::params::ruby_puppet_dir}/parser/functions/search_setup.rb":
		ensure => present,
		source => "puppet:///modules/mcollective/plugins/puppetlabs/agent/registration-mongodb/puppet/search_setup.rb"
	}
}
