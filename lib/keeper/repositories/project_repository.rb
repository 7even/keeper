class ProjectRepository
  include Lotus::Repository
  
  class << self
    def called(name)
      query { where(name: name) }.first
    end
  end
end
