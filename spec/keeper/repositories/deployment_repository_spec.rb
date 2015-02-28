RSpec.describe DeploymentRepository do
  describe '.find' do
    let(:deployment_id) { DeploymentRepository.first.id }
    
    it "fetches the deployment along with it's project" do
      deployment = DeploymentRepository.find(deployment_id)
      
      expect(deployment.project.name).to eq('First project')
      expect(deployment.environment.name).to eq('staging')
      expect(deployment.branch).to eq('new_feature')
    end
  end
  
  describe '.for_project' do
    let(:project) { ProjectRepository.last }
    
    it 'returns deployments for the specified project' do
      deployments = DeploymentRepository.for_project(project)
      
      expect(deployments.count).to eq(3)
      expect(deployments.first.environment.name).to eq('staging')
      expect(deployments.last.environment.name).to eq('production')
    end
  end
end
