class AdminController < Application::Controller
  def index
    @tiendas = Tiendas.all
  end
    
  def show
    
  end
end