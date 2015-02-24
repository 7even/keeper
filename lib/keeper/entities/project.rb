class Project
  include Lotus::Entity
  attributes :id, :name
  
  attr_accessor :last_deployment
  
  def last_deployed_at
    last_deployment.deployed_at unless last_deployment.nil?
  end
end
