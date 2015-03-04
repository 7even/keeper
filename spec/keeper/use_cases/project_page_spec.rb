RSpec.describe ProjectPage do
  subject { described_class.new(projects.first.id) }
  
  describe '#project' do
    it "returns the project with the specified id" do
      expect(subject.project).to be_a(Project)
      expect(subject.project.name).to eq('First project')
    end
  end
  
  describe '#deployments' do
    it "returns all project's deployments in reverse order grouped by environments" do
      expect(subject.deployments[staging.id].count).to eq(3)
      expect(subject.deployments[production.id].count).to eq(2)
      
      expect(subject.deployments[staging.id].first.branch).to eq('master')
      expect(subject.deployments[staging.id].last.branch).to eq('new_feature')
      expect(subject.deployments[production.id].first.branch).to eq('master')
      expect(subject.deployments[production.id].last.branch).to eq('new_feature')
    end
  end
  
  describe '#environments' do
    before(:each) do
      EnvironmentRepository.create(Environment.new(name: 'development'))
    end
    
    it 'returns all environments with at least one deployment' do
      expect(subject.environments.map(&:name)).to eq(%w(staging production))
    end
  end
end
