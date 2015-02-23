class Deployment
  include Lotus::Entity
  attributes :id, :project_id, :environment, :branch, :deployed_at
  
  attr_accessor :project
end
