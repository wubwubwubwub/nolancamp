require 'sinatra'

get '/main.css' do 
  scss :styles
end

get '/' do
  @title = "nolan | camp"
  slim :index
end

not_found do
  "404 not found"
end

# error do
#   @error = request.env['sinatra_error']
#   haml :error # if error template
# end

