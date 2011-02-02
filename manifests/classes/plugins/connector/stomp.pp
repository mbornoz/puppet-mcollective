# Class: mcollective::plugins::connector::stomp inherits mcollective::plugins::base
#
#
class mcollective::plugins::connector::stomp {
	class { "ruby::stomp": version => $mcollective::params::stomp_version }
}