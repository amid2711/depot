require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @update = {
      title: 'Lorem Ipsum',
      description: 'Wibble are fun!',
      image_url: 'lorem.jpg',
      price: 19.95
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
    assert_select 'h1', 'Listing products'
    assert_select '#columns #side a', minimum: 4
    assert_select '.list_line_odd .list_action a', minimum: 3
    assert_select '.list_line_odd .list_description dl dt', 'Programming Ruby 1.9'
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
    assert_select 'strong', 4
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
    assert_select 'form .field', 4
    assert_select 'form .actions', 1
  end

  test "should update product" do
    patch :update, id: @product, product: @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
