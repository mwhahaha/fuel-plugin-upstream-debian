notice('MOULAR: fuel-plugin-upstream-debian/apply_package_repos.pp')

$plugin_config = hiera('fuel-plugin-upstream-debian')
$deb_repo_url  = pick($plugin_config['deb_repo_url'], 'http://http.us.debian.org/debian')

apt::source { 'Debian':
  location => $deb_repo_url,
  release  => 'experimental',
  repos    => 'main contrib non-free'
}

apt::pin { 'Debian':
  packages   => '*',
  release    => 'experimental',
  originator => 'Debian',
  codename   => 'experimental',
  priority   => '9000',
}

