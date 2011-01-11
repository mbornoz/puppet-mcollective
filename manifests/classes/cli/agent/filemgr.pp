# Class: mcollective::cli::agent::filemgr
#
#
class mcollective::cli::agent::filemgr inherits mcollective::cli::base {
	mcollective::plugin::cli { "filemgr":
		ensure => present,
		type   => agent,
		ddl    => true
	}
}
