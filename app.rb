require 'sinatra/base'

require 'sprockets'
require 'sprockets-helpers'

require_relative 'lib/assets'
require_relative 'lib/global_settings'

class App < Sinatra::Base
  set :root          , GlobalSettings.root
  set :assets        , Assets.get(root)
  set :public_folder , "#{root}/public"
  set :views         , "#{root}/views"
  set :environment   , GlobalSettings.env

  configure do
    Sprockets::Helpers.configure do |config|
      config.environment = settings.assets
      config.prefix      = GlobalSettings.assets_prefix
      config.digest      = GlobalSettings.digest
      config.public_path = settings.public_folder
      config.debug       = GlobalSettings.debug

      unless GlobalSettings.development?
        config.manifest = Sprockets::Manifest.new(settings.assets, File.join(GlobalSettings.assets_path, 'manifest.json'))
      end
    end
  end

  configure :production do
    require 'newrelic_rpm'
  end

  helpers do
    include Sprockets::Helpers
  end

  get '/' do
    erb :index
  end
end

