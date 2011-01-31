# Class: mcollective::node
#
#
class mcollective::node inherits mcollective {
	include mcollective::common
	include mcollective::node::install
	include mcollective::node::config
	include mcollective::node::service
	include "mcollective::plugins::connector::${mcollective::params::connector}::node"
	include "mcollective::plugins::security::${mcollective::params::securityprovider}::node"
	include "mcollective::plugins::facts::${mcollective::params::factsource}"
	include mcollective::plugins::standard
	include $mcollective::params::repo
}
