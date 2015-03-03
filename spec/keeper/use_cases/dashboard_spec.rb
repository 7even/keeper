RSpec.describe Dashboard do
  before(:each) do
    ProjectRepository.create(Project.new(name: 'Empty project'))
  end
  
  describe '#projects' do
    it 'returns all projects with last deployments and environments' do
      expect(subject.projects.count).to eq(2)
      expect(subject.projects).to all(be_a(Project))
      
      expect(subject.projects.first.last_deployments.first.branch).to eq('master')
      expect(subject.projects.first.last_deployments.first.environment.name).to eq('staging')
      expect(subject.projects.first.last_deployments.last.branch).to eq('master')
      expect(subject.projects.first.last_deployments.last.environment.name).to eq('production')
      
      expect(subject.projects.last.last_deployments.first.branch).to eq('fix')
      expect(subject.projects.last.last_deployments.first.environment.name).to eq('staging')
      expect(subject.projects.last.last_deployments.last.branch).to eq('master')
      expect(subject.projects.last.last_deployments.last.environment.name).to eq('production')
    end
  end
end
