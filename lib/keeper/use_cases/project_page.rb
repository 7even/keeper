class ProjectPage
  attr_reader :project, :environments, :deployments
  
  def initialize(id)
    @project = ProjectRepository.find(id)
    collect_data unless @project.nil?
  end
  
private
  def collect_data
    deployments = DeploymentRepository.by_project_ids([project.id])
    deployments = deployments.descending_by_id
    
    @deployments  = deployments.group_by(&:environment_id)
    @environments = EnvironmentRepository.by_ids(@deployments.keys).to_a
  end
end
