# Class: mcollective::node::install
#
#
class mcollective::node::install {
	
	package { mcollective:
		ensure  => latest
	}
}
