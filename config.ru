CLIENT_PATH = File.dirname(__FILE__)

require File.join(CLIENT_PATH, 'app')

run App

if GlobalSettings.development?
  assets = Assets.get(CLIENT_PATH)
  map GlobalSettings.assets_prefix do
    run assets.index
  end
end # Otherwise we should have generated assets under the public folder.

