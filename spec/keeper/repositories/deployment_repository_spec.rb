RSpec.describe DeploymentRepository do
  before(:each) do
    first_project = ProjectRepository.persist(Project.new(name: 'First project'))
    
    first_deployment = Deployment.new(
      project_id:  first_project.id,
      environment: 'production',
      branch:      'master',
      deployed_at: Time.now
    )
    DeploymentRepository.persist(first_deployment)
    
    second_project = ProjectRepository.persist(Project.new(name: 'Second project'))
    
    second_deployment = Deployment.new(
      project_id:  second_project.id,
      environment: 'staging',
      branch:      'new_feature',
      deployed_at: Time.now
    )
    DeploymentRepository.persist(second_deployment)
  end
  
  describe '.find' do
    let(:deployment_id) { DeploymentRepository.first.id }
    
    it "fetches the deployment along with it's project" do
      deployment = DeploymentRepository.find(deployment_id)
      
      expect(deployment.environment).to eq('production')
      expect(deployment.branch).to eq('master')
      
      expect(deployment.project.name).to eq('First project')
    end
  end
  
  describe '.for_project' do
    let(:project) { ProjectRepository.last }
    
    it 'returns deployments for the specified project' do
      deployments = DeploymentRepository.for_project(project)
      
      expect(deployments.count).to eq(1)
      expect(deployments.first.environment).to eq('staging')
    end
  end
end
