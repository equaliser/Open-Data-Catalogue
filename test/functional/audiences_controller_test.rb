require 'test_helper'

class AudiencesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:audiences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create audience" do
    assert_difference('Audience.count') do
      post :create, :audience => { }
    end

    assert_redirected_to audience_path(assigns(:audience))
  end

  test "should show audience" do
    get :show, :id => audiences(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => audiences(:one).to_param
    assert_response :success
  end

  test "should update audience" do
    put :update, :id => audiences(:one).to_param, :audience => { }
    assert_redirected_to audience_path(assigns(:audience))
  end

  test "should destroy audience" do
    assert_difference('Audience.count', -1) do
      delete :destroy, :id => audiences(:one).to_param
    end

    assert_redirected_to audiences_path
  end
end
