require 'json'
require 'yaml'
require 'fileutils'

require 'sprockets'
# we need to pick boot classes of our client
require File.expand_path('../../assets',  __FILE__)
require File.expand_path('../../global_settings', __FILE__)

namespace :assets do
  CLIENT_PATH = File.join(File.dirname(__FILE__), '..', '..')

  desc 'Precompile assets for the client production'
  task :precompile => :clean do
    puts "Precompiling assets..."
    assets = Assets.get(CLIENT_PATH)
    compiler = Sprockets::Manifest.new(assets, GlobalSettings.assets_path)
    compiler.compile
    puts "Done"
  end

  desc "Clean assets folder"
  task :clean do
    puts "Destroying public/assets..."
    FileUtils.rm_rf File.join(CLIENT_PATH, "/public/assets")
  end
end

