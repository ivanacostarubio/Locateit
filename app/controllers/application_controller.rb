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
end
