class Tienda < ActiveRecord::Base
  before_save :format_address
  acts_as_mappable :auto_geocode => {:field => :direccion }
  
 #validates_presence_of :nombre, :direccion, :ciudad, :estado, :codigo_postal, :pais
 
 def format_address
  self.direccion = self.direccion + " " + self.ciudad + " " + self.estado + " " + self.pais
 end
end
