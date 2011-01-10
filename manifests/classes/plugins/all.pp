# Class: mcollective::plugins::all
#
#
class mcollective::plugins::all inherits mcollective::plugins::standard {
	include mcollective::plugins::audit
	include mcollective::plugins::agent::exim
	include mcollective::plugins::agent::nettest
	include mcollective::plugins::agent::nrpe
	include mcollective::plugins::agent::registration
	include mcollective::plugins::agent::urltest
	include mcollective::plugins::agent::vcsmgr
}