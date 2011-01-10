# Class: mcollective::mongodb inherits mcollective
#
#
class mcollective::mongodb inherits mcollective {
	include ruby::mongo
	include mcollective::server
	include mcollective::plugins::registration::mongodb
	
	Class["mongodb"] -> Class["ruby::mongo"] -> Class["mcollective::server"] -> Class["mcollective::plugins::registration::mongodb"]
}
