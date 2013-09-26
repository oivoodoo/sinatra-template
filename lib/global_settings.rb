# We can replace this module methods by the proper values in case we decide to
# move client to the separate node to serve the client only things.
module GlobalSettings
  def self.root
    File.expand_path('../..', __FILE__)
  end

  DEFAULT_ENV = 'development'
  def self.env
    ENV.fetch('RACK_ENV', DEFAULT_ENV)
  end

  def self.assets_prefix
    '/assets'
  end

  def self.assets_path
    File.join(root, 'public', 'assets')
  end

  def self.digest
    true
  end

  def self.debug
    development?
  end

  def self.development?
    env.to_s == 'development'
  end
end

