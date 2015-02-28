module Populate
  def setup_test_environment
    [
      ['new_feature', staging],
      ['new_feature', staging],
      ['new_feature', production],
      ['master',      staging],
      ['master',      production]
    ].each.with_index do |(branch, environment), index|
      DeploymentRepository.persist(
        Deployment.new(
          project_id:     projects.first.id,
          environment_id: environment.id,
          branch:         branch,
          deployed_at:    now + index
        )
      )
    end
    
    [
      ['fix',    staging],
      ['fix',    staging],
      ['master', production]
    ].each.with_index do |(branch, environment), index|
      DeploymentRepository.persist(
        Deployment.new(
          project_id:     projects.last.id,
          environment_id: environment.id,
          branch:         branch,
          deployed_at:    now + index
        )
      )
    end
  end
  
private
  def now
    @now ||= Time.now
  end
  
  def projects
    @projects ||= ['First project', 'Second project'].map do |project_name|
      ProjectRepository.persist(Project.new(name: project_name))
    end
  end
  
  def staging
    @staging ||= EnvironmentRepository.persist(Environment.new(name: 'staging'))
  end
  
  def production
    @production ||= EnvironmentRepository.persist(Environment.new(name: 'production'))
  end
end
