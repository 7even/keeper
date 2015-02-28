RSpec.describe ProjectRepository do
  describe '.with_last_deployment' do
    it 'fetches the projects with their last deployments' do
      projects = ProjectRepository.with_last_deployment
      
      expect(projects.count).to eq(2)
      
      expect(projects.first.name).to eq('First project')
      expect(projects.first.last_deployment.deployed_at).to eq(now + 4)
      
      expect(projects.last.name).to eq('Second project')
      expect(projects.last.last_deployment.deployed_at).to eq(now + 2)
    end
  end
end
