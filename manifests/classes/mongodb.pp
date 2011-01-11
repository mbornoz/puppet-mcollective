# Class: mcollective::mongodb inherits mcollective
#
#
class mcollective::mongodb inherits mcollective {
	include ruby::mongo
	include mcollective::node
	include mcollective::plugins::agent::registration::mongodb
	
	Class["mongodb"] -> Class["ruby::mongo"] -> Class["mcollective::node"] -> Class["mcollective::plugins::agent::registration::mongodb"]
}
