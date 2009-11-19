require 'test_helper'

class TiendasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tiendas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tienda" do
    assert_difference('Tienda.count') do
      post :create, :tienda => { }
    end

    assert_redirected_to tienda_path(assigns(:tienda))
  end

  test "should show tienda" do
    get :show, :id => tiendas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tiendas(:one).to_param
    assert_response :success
  end

  test "should update tienda" do
    put :update, :id => tiendas(:one).to_param, :tienda => { }
    assert_redirected_to tienda_path(assigns(:tienda))
  end

  test "should destroy tienda" do
    assert_difference('Tienda.count', -1) do
      delete :destroy, :id => tiendas(:one).to_param
    end

    assert_redirected_to tiendas_path
  end
end
