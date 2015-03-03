class DeploymentRepository
  include Lotus::Repository
  
  class << self
    def by_project_ids(ids)
      query { where(project_id: ids) }
    end
    
    def by_environment_ids(ids)
      query { where(environment_id: ids) }
    end
    
    def descending_by_id
      query { desc(:id) }
    end
  end
end
