# Class: mcollective::client::install
#
#
class mcollective::client::install {
	package { mcollective-client:
		ensure  => latest,
		require => $mcollective::params::pkg_deps
	}
}
