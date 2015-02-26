class Deployment
  include Lotus::Entity
  attributes :id, :project_id, :environment_id, :branch, :deployed_at
  
  attr_accessor :project
  attr_accessor :environment
end
