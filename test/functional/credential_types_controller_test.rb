require 'test_helper'

class CredentialTypesControllerTest < ActionController::TestCase
  setup do
    @credential_type = credential_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:credential_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create credential_type" do
    assert_difference('CredentialType.count') do
      post :create, credential_type: { type: @credential_type.type }
    end

    assert_redirected_to credential_type_path(assigns(:credential_type))
  end

  test "should show credential_type" do
    get :show, id: @credential_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @credential_type
    assert_response :success
  end

  test "should update credential_type" do
    put :update, id: @credential_type, credential_type: { type: @credential_type.type }
    assert_redirected_to credential_type_path(assigns(:credential_type))
  end

  test "should destroy credential_type" do
    assert_difference('CredentialType.count', -1) do
      delete :destroy, id: @credential_type
    end

    assert_redirected_to credential_types_path
  end
end
