module Web::Controllers::Dashboard
  class Index
    include Web::Action
    
    expose :projects
    
    def call(params)
      @projects = ProjectRepository.all
    end
  end
end
