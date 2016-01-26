require 'rubygems'
require 'sinatra'
require 'slim'

configure do
  # set :name, "DAZ"
  # set(:digit){ rand(10) }
end

# ----------------------------------------------- 

get('/main.css'){ scss :styles }

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

__END__
