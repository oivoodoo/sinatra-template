class Assets
  def self.get(root)
    assets = Sprockets::Environment.new(root)

    assets.append_path File.join(root, 'assets', 'stylesheets')
    assets.append_path File.join(root, 'assets', 'javascripts')
    assets.append_path File.join(root, 'assets', 'images')

    assets
  end
end

