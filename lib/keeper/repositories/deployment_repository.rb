class DeploymentRepository
  include Lotus::Repository
  
  class << self
    def find(id)
      super.tap do |deployment|
        deployment.project = ProjectRepository.find(deployment.project_id)
      end
    end
    
    def for_project(project)
      query do
        where(project_id: project.id)
      end
    end
  end
end
