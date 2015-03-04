module Api::Views::Main
  class Payload
    include Api::View
    
    def render
      Oj.dump(status: 'success', project: params[:project_name])
    end
  end
end
