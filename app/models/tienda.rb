class Tienda < ActiveRecord::Base
  acts_as_mappable :auto_geocode => {:field => :direccion }
  
end
