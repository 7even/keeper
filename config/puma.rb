require 'pathname'
root = Pathname.new(__FILE__).realpath.join('../../../..')

current = root.join('current')
shared = root.join('shared')

directory current.to_s
rackup    current.join('config.ru').to_s

# workers 2
environment 'production'

daemonize
pidfile     shared.join('tmp/pids/puma.pid').to_s
state_path  shared.join('tmp/puma.state').to_s

bind 'tcp://0.0.0.0:2300'

stdout_path = shared.join('log/stdout.log').to_s
stderr_path = shared.join('log/stderr.log').to_s
stdout_redirect stdout_path, stderr_path, true

activate_control_app "unix://#{shared}/tmp/pumactl.sock"
