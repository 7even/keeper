module Api::Controllers::Main
  class Payload
    include Api::Action
    
    params do
      param :project,     presence: true, format: /\A[a-z_]+\z/
      param :environment, presence: true, format: /\A[a-z_]+\z/
      param :branch,      presence: true, format: /\A[a-z0-9_\-.]+\z/
    end
    
    def call(params)
      if params.valid?
        HandlePayload.call(params[:project], params[:environment], params[:branch])
        halt 201 # Created
      else
        halt 400 # Bad Request
      end
    end
  end
end
