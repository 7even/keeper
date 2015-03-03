class Project
  include Lotus::Entity
  attributes :id, :name
  
  def last_deployments
    @last_deployments ||= []
  end
end
