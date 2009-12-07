class Tienda < ActiveRecord::Base
  acts_as_mappable :auto_geocode => {:field => :direccion }
  
 #validates_presence_of :nombre, :direccion, :ciudad, :estado, :codigo_postal, :pais
end
