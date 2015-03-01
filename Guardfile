## Uncomment and set this to only include directories you want to watch
directories %w(apps lib spec)

## Uncomment to clear the screen before every task
clearing :on

guard :rspec, cmd: 'bundle exec rspec', all_on_start: true do
  require 'guard/rspec/dsl'
  dsl = Guard::RSpec::Dsl.new(self)
  
  rspec = dsl.rspec
  watch(rspec.spec_helper)  { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)
  
  watch(%r{^lib/keeper/(.+)\.rb}) { |m| "spec/keeper/#{m[1]}_spec.rb" }
end
