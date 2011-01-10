# Class: mcollective::plugins::standard
#
#
class mcollective::plugins::standard {
	include mcollective::plugins::agent::filemgr
	include mcollective::plugins::agent::iptables
	include mcollective::plugins::agent::package
	include mcollective::plugins::agent::process
	include mcollective::plugins::agent::puppetd
	include mcollective::plugins::agent::service
	
	if ( $mcollective_registration == "true" ) {
		include mcollective::plugins::registration::meta
	}
}