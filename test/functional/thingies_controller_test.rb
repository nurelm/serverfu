require 'test_helper'

class ThingiesControllerTest < ActionController::TestCase
  setup do
    @thingy = thingies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thingies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thingy" do
    assert_difference('Thingy.count') do
      post :create, thingy: { name: @thingy.name }
    end

    assert_redirected_to thingy_path(assigns(:thingy))
  end

  test "should show thingy" do
    get :show, id: @thingy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @thingy
    assert_response :success
  end

  test "should update thingy" do
    put :update, id: @thingy, thingy: { name: @thingy.name }
    assert_redirected_to thingy_path(assigns(:thingy))
  end

  test "should destroy thingy" do
    assert_difference('Thingy.count', -1) do
      delete :destroy, id: @thingy
    end

    assert_redirected_to thingies_path
  end
end
