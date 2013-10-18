require 'test_helper'

class ResourceServicesControllerTest < ActionController::TestCase
  setup do
    @resource_service = resource_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resource_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resource_service" do
    assert_difference('ResourceService.count') do
      post :create, resource_service: { resource_id: @resource_service.resource_id, service_id: @resource_service.service_id, service_type_id: @resource_service.service_type_id }
    end

    assert_redirected_to resource_service_path(assigns(:resource_service))
  end

  test "should show resource_service" do
    get :show, id: @resource_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resource_service
    assert_response :success
  end

  test "should update resource_service" do
    patch :update, id: @resource_service, resource_service: { resource_id: @resource_service.resource_id, service_id: @resource_service.service_id, service_type_id: @resource_service.service_type_id }
    assert_redirected_to resource_service_path(assigns(:resource_service))
  end

  test "should destroy resource_service" do
    assert_difference('ResourceService.count', -1) do
      delete :destroy, id: @resource_service
    end

    assert_redirected_to resource_services_path
  end
end
