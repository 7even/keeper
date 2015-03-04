# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage

get '/', to: 'dashboard#index'
get '/projects/:id', to: 'projects#show'
