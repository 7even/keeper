class HandlePayload
  attr_reader :project, :environment, :branch
  
  def initialize(project_name, environment_name, branch)
    @project     = project_called(project_name)
    @environment = environment_called(environment_name)
    @branch      = branch
  end
  
  def call
    deployment = Deployment.new(
      project_id:     project.id,
      environment_id: environment.id,
      branch:         branch,
      deployed_at:    Time.now
    )
    
    DeploymentRepository.create(deployment)
  end
  
private
  def project_called(project_name)
    if project = ProjectRepository.called(project_name)
      project
    else
      ProjectRepository.create(Project.new(name: project_name))
    end
  end
  
  def environment_called(environment_name)
    if environment = EnvironmentRepository.called(environment_name)
      environment
    else
      EnvironmentRepository.create(Environment.new(name: environment_name))
    end
  end
  
  class << self
    def call(project, environment, branch)
      new(project, environment, branch).call
    end
  end
end
