require 'bundler/setup'
require 'lotus/setup'
require 'time-lord'
require 'oj'

require_relative '../lib/keeper'
require_relative '../apps/web/application'
require_relative '../apps/api/application'

Lotus::Application.preload_applications!

Lotus::Container.configure do
  mount Api::Application, at: '/api'
  mount Web::Application, at: '/'
end
