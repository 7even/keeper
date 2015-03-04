class EnvironmentRepository
  include Lotus::Repository
  
  class << self
    def by_ids(ids)
      query { where(id: ids) }
    end
    
    def called(name)
      query { where(name: name) }.first
    end
  end
end
