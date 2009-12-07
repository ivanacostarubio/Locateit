# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "geokit"
  config.gem 'cucumber'
  config.gem 'factory_girl'
  
  config.time_zone = 'UTC'

end

GOOGLE_APPLICATION_ID = "ABQIAAAAwk9cM7XgXv55U_ljM6-oAhRULQ7kQx9rWeXH9H7y5EoMxImrQBQ6oTzAj49HPy7vN5Qra_nl9czwqQ"