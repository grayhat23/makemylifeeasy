require 'test_helper'

class RequestSchedulesControllerTest < ActionController::TestCase
  setup do
    @request_schedule = request_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_schedule" do
    assert_difference('RequestSchedule.count') do
      post :create, request_schedule: { address: @request_schedule.address, end_date: @request_schedule.end_date, phone_number: @request_schedule.phone_number, request_id: @request_schedule.request_id, s_type: @request_schedule.s_type, start_time: @request_schedule.start_time }
    end

    assert_redirected_to request_schedule_path(assigns(:request_schedule))
  end

  test "should show request_schedule" do
    get :show, id: @request_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_schedule
    assert_response :success
  end

  test "should update request_schedule" do
    patch :update, id: @request_schedule, request_schedule: { address: @request_schedule.address, end_date: @request_schedule.end_date, phone_number: @request_schedule.phone_number, request_id: @request_schedule.request_id, s_type: @request_schedule.s_type, start_time: @request_schedule.start_time }
    assert_redirected_to request_schedule_path(assigns(:request_schedule))
  end

  test "should destroy request_schedule" do
    assert_difference('RequestSchedule.count', -1) do
      delete :destroy, id: @request_schedule
    end

    assert_redirected_to request_schedules_path
  end
end
