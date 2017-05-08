require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "e6b777bc664af6f0cd95a4ed4fd75c8074fa362ddfe2c51cd37bf24c4f473283"

  url_format "/media/:job/:name"

  datastore = Dragonfly::DataStorage::CloudinaryStore.new

end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
