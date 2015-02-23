RSpec.describe DeploymentRepository do
  describe '.find' do
    before(:each) do
      project = ProjectRepository.persist(Project.new(name: 'some_project'))
      
      deployment = Deployment.new(
        project_id:  project.id,
        environment: 'production',
        branch:      'master',
        deployed_at: Time.now
      )
      DeploymentRepository.persist(deployment)
    end
    
    let(:deployment_id) { DeploymentRepository.last.id }
    
    it "fetches the deployment along with it's project" do
      deployment = DeploymentRepository.find(deployment_id)
      
      expect(deployment.environment).to eq('production')
      expect(deployment.branch).to eq('master')
      
      expect(deployment.project.name).to eq('some_project')
    end
  end
end
