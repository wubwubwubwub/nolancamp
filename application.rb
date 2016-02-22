ENV['RACK_ENV'] ||= 'development'
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

class Application < Sinatra::Base
  configure do
    set :assets_precompile, %w(application.js application.css *.png *.jpg)
    set :assets_css_compressor, :sass
    set :assets_js_compressor, :uglifier
    register Sinatra::AssetPipeline

    if defined?(RailsAssets)
      RailsAssets.load_paths.each do |path|
        settings.sprockets.append_path(path)
      end
    end
  end

  get '/main.css' do
    scss :application
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
end
