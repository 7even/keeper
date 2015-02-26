class DeploymentRepository
  include Lotus::Repository
  
  class << self
    def find(id)
      super.tap do |deployment|
        deployment.project = ProjectRepository.find(deployment.project_id)
        deployment.environment = EnvironmentRepository.find(deployment.environment_id)
      end
    end
    
    def for_project(project)
      query do
        where(project_id: project.id)
      end.each do |deployment|
        deployment.environment = EnvironmentRepository.find(deployment.environment_id)
      end
    end
  end
end
