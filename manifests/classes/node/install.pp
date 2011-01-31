# Class: mcollective::node::install
#
#
class mcollective::node::install {
	package { mcollective:
		ensure  => latest,
		require => $mcollective::params::pkg_deps
	}
}
