# Class: mcollective::cli::standard
#
#
class mcollective::cli::standard {
	include mcollective::cli::agent::filemgr
	include mcollective::cli::agent::iptables
	include mcollective::cli::agent::package
	include mcollective::cli::agent::process
	include mcollective::cli::agent::puppetd
	include mcollective::cli::agent::service
	include mcollective::cli::util::ssh
}
