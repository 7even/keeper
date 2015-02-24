class ProjectRepository
  include Lotus::Repository
  
  class << self
    def with_last_deployment
      all.each do |project|
        project.last_deployment = DeploymentRepository.for_project(project).to_a.last
      end
    end
  end
end
