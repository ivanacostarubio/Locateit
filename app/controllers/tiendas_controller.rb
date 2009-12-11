class TiendasController < ApplicationController
  before_filter :procesar_ciudades, :cuantos_churromanias
  geocode_ip_address
    
  def index
    @tiendas = Tienda.find(:all)  
    @tienda = Tienda.new  
    
    dibujar_tiendas(@tiendas)
   
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tiendas }
    end
  end

  def show
    @tienda = Tienda.find(params[:id])
    dibujar_tienda(@tienda)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tienda }
    end
  end

  def new
    @tienda = Tienda.new

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @tienda }
    end
  end

  def edit
    @tienda = Tienda.find(params[:id])
    
    @map = GoogleMap::Map.new
    @map.zoom = 8 #200km
    @map.markers << GoogleMap::Marker.new(:map => @map, 
                                          :lat => @tienda.lat, 
                                          :lng => @tienda.lng,
                                          :marker_icon_path => '/images/estrella.png'
                                          )
    
  end

  def create
    @tienda = Tienda.new(params[:tienda])

    respond_to do |format|
      if @tienda.save
        flash[:notice] = 'Tienda was successfully created.'
        format.html { redirect_to(@tienda) }
        format.xml  { render :xml => @tienda, :status => :created, :location => @tienda }
      else
        flash[:error] = "Upsss... Google no pudo codificar la direccion. Prueba haciendo la direccion mas general."
        format.html { redirect_to '/' }
        format.xml  { render :xml => @tienda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tiendas/1
  # PUT /tiendas/1.xml
  def update
    @tienda = Tienda.find(params[:id])

    respond_to do |format|
      if @tienda.update_attributes(params[:tienda])
        flash[:notice] = 'Tienda was successfully updated.'
        format.html { redirect_to(@tienda) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tienda.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @tienda = Tienda.find(params[:id])
    @tienda.destroy

    respond_to do |format|
      format.html { redirect_to(tiendas_url) }
      format.xml  { head :ok }
    end
  end
    
end
