# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  private 
  
  def cuantos_churromanias
    @numero_churromanias = Tienda.count
  end
  
  def procesar_ciudades
    @tiendas = Tienda.all
    @ciudades = Array.new
    @tiendas.each do |tienda|
      @ciudades << tienda.ciudad.upcase
    end
    @ciudades.sort!.uniq!
  end
  
  
  def dibujar_tiendas(tiendas)
    @map = GoogleMap::Map.new
    @map.zoom = 5 #200km

    @tiendas.each do |tienda|
      @map.markers << GoogleMap::Marker.new(:map => @map,  :lat => tienda.lat,  :lng => tienda.lng,
                                          :marker_icon_path => '/images/estrella.png', :marker_hover_text => tienda.nombre)
    end
  end
  
  def dibujar_tienda(tienda)
    @map = GoogleMap::Map.new
    @map.zoom = 14 #200km
    @map.markers << GoogleMap::Marker.new(:map => @map,:lat => @tienda.lat, 
                                         :lng => @tienda.lng, :marker_icon_path => '/images/estrella.png')
  end
  
  
  
end
