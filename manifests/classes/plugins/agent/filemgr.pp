# Class: mcollective::plugins::agent::filemgr
#
#
class mcollective::plugins::agent::filemgr inherits mcollective::plugins::base {
	mcollective::plugin { "filemgr":
		ensure => present,
		type   => "agent",
		ddl    => true
	}
}
