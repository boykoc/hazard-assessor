require 'test_helper'

class NeededControlsControllerTest < ActionController::TestCase
  setup do
    @needed_control = needed_controls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:needed_controls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create needed_control" do
    assert_difference('NeededControl.count') do
      post :create, needed_control: { completed: @needed_control.completed, content: @needed_control.content, hazard_id: @needed_control.hazard_id }
    end

    assert_redirected_to needed_control_path(assigns(:needed_control))
  end

  test "should show needed_control" do
    get :show, id: @needed_control
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @needed_control
    assert_response :success
  end

  test "should update needed_control" do
    patch :update, id: @needed_control, needed_control: { completed: @needed_control.completed, content: @needed_control.content, hazard_id: @needed_control.hazard_id }
    assert_redirected_to needed_control_path(assigns(:needed_control))
  end

  test "should destroy needed_control" do
    assert_difference('NeededControl.count', -1) do
      delete :destroy, id: @needed_control
    end

    assert_redirected_to needed_controls_path
  end
end
