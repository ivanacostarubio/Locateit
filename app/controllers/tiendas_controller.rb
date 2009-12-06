class TiendasController < ApplicationController
  before_filter :cuantos_churromanias, :procesar_ciudades
  geocode_ip_address
  
  
    # GET /tiendas
  # GET /tiendas.xml
  def index
    @tiendas = Tienda.find(:all, :origin => "900 biscayne bay miami, fl", :order=>'distance')  
    @tienda = Tienda.new
    
    dibujar_tiendas(@tiendas)
   
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tiendas }
    end
  end

  # GET /tiendas/1
  # GET /tiendas/1.xml
  def show
    @tienda = Tienda.find(params[:id])
    dibujar_tienda(@tienda)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tienda }
    end
  end

  # GET /tiendas/new
  # GET /tiendas/new.xml
  def new
    @tienda = Tienda.new

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @tienda }
    end
  end

  # GET /tiendas/1/edit
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

  # POST /tiendas
  # POST /tiendas.xml
  def create
    @tienda = Tienda.new(params[:tienda])

    respond_to do |format|
      if @tienda.save
        flash[:notice] = 'Tienda was successfully created.'
        format.html { redirect_to(@tienda) }
        format.xml  { render :xml => @tienda, :status => :created, :location => @tienda }
      else
        flash[:error] = "Upsss... Google no pudo codificar la direccion. Prueba haciendo la direccion mas general."
        format.html { redirect_to :back }
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

  # DELETE /tiendas/1
  # DELETE /tiendas/1.xml
  def destroy
    @tienda = Tienda.find(params[:id])
    @tienda.destroy

    respond_to do |format|
      format.html { redirect_to(tiendas_url) }
      format.xml  { head :ok }
    end
  end
  
  
  private
  
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
