notice('MOULAR: fuel-plugin-upstream-debian/apply_mos_package_pins.pp')

# we need the mos fork haproxy
apt::pin { 'haproxy-mos':
  packages   => 'haproxy',
  originator => 'Mirantis',
  priority   => '9001',
}
