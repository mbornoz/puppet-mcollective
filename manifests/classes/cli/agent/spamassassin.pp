# Class: mcollective::cli::agent::spamassassin
#
#
class mcollective::cli::agent::spamassassin {
	mcollective::plugin::cli { "spamassassin":
		ensure => present,
		type   => agent,
		repo   => "mstanislav",
		ddl    => true
	}
}
