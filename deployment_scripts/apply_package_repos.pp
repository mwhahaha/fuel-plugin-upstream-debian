notice('MOULAR: fuel-plugin-upstream-debian/apply_package_repos.pp')

$plugin_config = hiera('fuel-plugin-upstream-debian')
$deb_repo_url  = pick($plugin_config['deb_repo_url'], 'http://http.us.debian.org/debian')
$use_experimental = pick($plugin_config['deb_use_experimental'], false)

apt::source { 'debian-unstable':
  location => $deb_repo_url,
  release  => 'unstable',
  repos    => 'main contrib non-free'
}
apt::pin { 'debian-unstable':
  packages => '*',
  release  => 'unstable',
  priority => '9000',
}

if $use_experimental {
  apt::source { 'debian-experimental':
    location => $deb_repo_url,
    release  => 'experimental',
    repos    => 'main contrib non-free'
  }
  apt::pin { 'debian-experimental':
    packages => '*',
    release  => 'experimental',
    priority => '9000',
  }
}

