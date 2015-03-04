class EnvironmentRepository
  include Lotus::Repository
  
  class << self
    def by_ids(ids)
      query { where(id: ids) }
    end
  end
end
