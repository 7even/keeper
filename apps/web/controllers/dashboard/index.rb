module Web::Controllers::Dashboard
  class Index
    include Web::Action
    
    expose :projects
    
    def call(params)
      @projects = ProjectRepository.with_last_deployment
    end
  end
end
