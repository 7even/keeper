require 'lotus/model'
Dir["#{__dir__}/keeper/**/*.rb"].each { |file| require_relative(file) }

Lotus::Model.configure do
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/keeper_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/keeper_development.db'
  #    adapter type: :sql, uri: 'postgres://localhost/keeper_development'
  #    adapter type: :sql, uri: 'mysql://localhost/keeper_development'
  #
  adapter type: :sql, uri: ENV['KEEPER_DATABASE_URL']
  
  ##
  # Database mapping
  #
  # You can specify mapping file to load with:
  #
  mapping "#{__dir__}/config/mapping"
end.load!

Oj.default_options = {
  mode: :compat,
  symbol_keys: true
}
