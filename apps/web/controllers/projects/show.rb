module Web::Controllers::Projects
  class Show
    include Web::Action
    
    expose :project_page
    
    def call(params)
      @project_page = ProjectPage.new(params[:id])
    end
  end
end
