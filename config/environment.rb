require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require 'time-lord'
require_relative '../lib/keeper'
require_relative '../apps/web/application'

Lotus::Container.configure do
  mount Web::Application, at: '/'
end
