# Class: mcollective::cli::agent::spamassassin
#
#
class mcollective::cli::agent::spamassassin inherits mcollective::cli::base {
	mcollective::plugin::cli { "spamassassin":
		ensure => present,
		type   => agent,
		repo   => "mstanislav",
		ddl    => true
	}
}
