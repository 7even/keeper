class Dashboard
  attr_reader :projects
  
  def initialize
    @projects = []
    collect_deployments
  end
  
private
  def collect_deployments
    all_projects = ProjectRepository.all
    environments = EnvironmentRepository.all
    
    deployments = DeploymentRepository.by_project_ids(all_projects.map(&:id))
    deployments = deployments.by_environment_ids(environments.map(&:id))
    deployments = deployments.descending_by_id
    
    all_projects.each do |project|
      environments.each do |environment|
        deployment = deployments.find do |deployment|
          deployment.project_id == project.id && deployment.environment_id == environment.id
        end
        
        if deployment
          deployment.environment = environment
          project.last_deployments << deployment
        end
      end
      
      projects << project unless project.last_deployments.empty?
    end
  end
end
