require 'test_helper'

class ResourceRatingsControllerTest < ActionController::TestCase
  setup do
    @resource_rating = resource_ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resource_ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resource_rating" do
    assert_difference('ResourceRating.count') do
      post :create, resource_rating: { comments: @resource_rating.comments, customer_id: @resource_rating.customer_id, rating: @resource_rating.rating, request_id: @resource_rating.request_id, resource_id: @resource_rating.resource_id }
    end

    assert_redirected_to resource_rating_path(assigns(:resource_rating))
  end

  test "should show resource_rating" do
    get :show, id: @resource_rating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resource_rating
    assert_response :success
  end

  test "should update resource_rating" do
    patch :update, id: @resource_rating, resource_rating: { comments: @resource_rating.comments, customer_id: @resource_rating.customer_id, rating: @resource_rating.rating, request_id: @resource_rating.request_id, resource_id: @resource_rating.resource_id }
    assert_redirected_to resource_rating_path(assigns(:resource_rating))
  end

  test "should destroy resource_rating" do
    assert_difference('ResourceRating.count', -1) do
      delete :destroy, id: @resource_rating
    end

    assert_redirected_to resource_ratings_path
  end
end
