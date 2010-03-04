require 'test_helper'

class LicencesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:licences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create licence" do
    assert_difference('Licence.count') do
      post :create, :licence => { }
    end

    assert_redirected_to licence_path(assigns(:licence))
  end

  test "should show licence" do
    get :show, :id => licences(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => licences(:one).to_param
    assert_response :success
  end

  test "should update licence" do
    put :update, :id => licences(:one).to_param, :licence => { }
    assert_redirected_to licence_path(assigns(:licence))
  end

  test "should destroy licence" do
    assert_difference('Licence.count', -1) do
      delete :destroy, :id => licences(:one).to_param
    end

    assert_redirected_to licences_path
  end
end
