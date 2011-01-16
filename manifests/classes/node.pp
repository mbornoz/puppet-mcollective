# Class: mcollective::node
#
#
class mcollective::node inherits mcollective {
	include mcollective::common
	include mcollective::node::install
	include mcollective::node::config
	include mcollective::node::service
	include "mcollective::plugins::connector::${mcollective_connector}::node"
	include "mcollective::plugins::security::${mcollective_securityprovider}::node"
	include "mcollective::plugins::facts::${mcollective_factsource}"
	include mcollective::plugins::standard
	include $repo
}
