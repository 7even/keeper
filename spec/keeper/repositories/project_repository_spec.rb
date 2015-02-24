RSpec.describe ProjectRepository do
  describe '.with_last_deployment' do
    let(:now) { Time.now }
    
    before(:each) do
      first_project = ProjectRepository.persist(Project.new(name: 'First project'))
      
      5.times do |i|
        DeploymentRepository.persist(
          Deployment.new(
            project_id:  first_project.id,
            environment: 'production',
            branch:      'master',
            deployed_at: now + i
          )
        )
      end
      
      second_project = ProjectRepository.persist(Project.new(name: 'Second project'))
      
      3.times do |i|
        DeploymentRepository.persist(
          Deployment.new(
            project_id:  second_project.id,
            environment: 'staging',
            branch:      'feature',
            deployed_at: now + i
          )
        )
      end
    end
    
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
