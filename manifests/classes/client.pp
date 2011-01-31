# Class: mcollective::client
#
#
class mcollective::client inherits mcollective {
	include mcollective::common
	include mcollective::client::install
	include mcollective::client::config
	include "mcollective::plugins::connector::${mcollective::params::connector}::client"
	include "mcollective::plugins::security::${mcollective::params::securityprovider}::client"
	include mcollective::cli::standard
	include $repo
}
