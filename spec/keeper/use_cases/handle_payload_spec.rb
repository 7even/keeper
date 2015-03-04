RSpec.describe HandlePayload do
  describe '.call' do
    context 'on an empty database' do
      it 'creates a project, an environment and a new deployment' do
        described_class.call('First project', 'production', 'master')
        
        expect(ProjectRepository.all.count).to eq(1)
        expect(ProjectRepository.first.name).to eq('First project')
        
        expect(EnvironmentRepository.all.count).to eq(1)
        expect(EnvironmentRepository.first.name).to eq('production')
        
        expect(DeploymentRepository.all.count).to eq(1)
        expect(DeploymentRepository.first.project_id).to eq(ProjectRepository.first.id)
        expect(DeploymentRepository.first.environment_id).to eq(EnvironmentRepository.first.id)
        expect(DeploymentRepository.first.branch).to eq('master')
      end
    end
    
    context 'with an existing project' do
      before(:each) do
        described_class.call('First project', 'staging', 'auth_fix')
      end
      
      it 'creates a new deployment referencing the existing project' do
        described_class.call('First project', 'production', 'master')
        
        expect(ProjectRepository.all.count).to eq(1)
        expect(EnvironmentRepository.all.count).to eq(2)
        expect(EnvironmentRepository.last.name).to eq('production')
        
        expect(DeploymentRepository.all.count).to eq(2)
        expect(DeploymentRepository.last.project_id).to eq(ProjectRepository.first.id)
        expect(DeploymentRepository.last.environment_id).to eq(EnvironmentRepository.last.id)
      end
    end
    
    context 'with an existing environment' do
      before(:each) do
        described_class.call('First project', 'staging', 'auth_fix')
      end
      
      it 'creates a new deployment referencing the existing environment' do
        described_class.call('First project', 'staging', 'master')
        
        expect(ProjectRepository.all.count).to eq(1)
        expect(EnvironmentRepository.all.count).to eq(1)
        
        expect(DeploymentRepository.all.count).to eq(2)
        expect(DeploymentRepository.last.project_id).to eq(ProjectRepository.first.id)
        expect(DeploymentRepository.last.environment_id).to eq(EnvironmentRepository.first.id)
      end
    end
  end
end
