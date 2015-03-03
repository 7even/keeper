module Web::Controllers::Dashboard
  class Index
    include Web::Action
    
    expose :dashboard
    
    def call(params)
      @dashboard = Dashboard.new
    end
  end
end
