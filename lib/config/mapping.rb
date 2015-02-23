collection :projects do
  entity     Project
  repository ProjectRepository
  
  attribute :id,   Integer
  attribute :name, String
end

collection :deployments do
  entity     Deployment
  repository DeploymentRepository
  
  attribute :id,          Integer
  attribute :project_id,  Integer
  attribute :environment, String
  attribute :branch,      String
  attribute :deployed_at, Time
end
