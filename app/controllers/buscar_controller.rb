class BuscarController < ApplicationController
  before_filter :procesar_ciudades, :cuantos_churromanias
  
  def show
    @tienda = Tienda.new  
    @tiendas = Tienda.find(:all, :conditions => {:ciudad => params[:id]})
    dibujar_tiendas(@tiendas)
  end
end