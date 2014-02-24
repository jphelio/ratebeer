require 'test_helper'

class MemebershipsControllerTest < ActionController::TestCase
  setup do
    @memebership = memeberships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memeberships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create memebership" do
    assert_difference('Memebership.count') do
      post :create, memebership: { beer_club_id: @memebership.beer_club_id, user_id: @memebership.user_id }
    end

    assert_redirected_to memebership_path(assigns(:memebership))
  end

  test "should show memebership" do
    get :show, id: @memebership
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @memebership
    assert_response :success
  end

  test "should update memebership" do
    patch :update, id: @memebership, memebership: { beer_club_id: @memebership.beer_club_id, user_id: @memebership.user_id }
    assert_redirected_to memebership_path(assigns(:memebership))
  end

  test "should destroy memebership" do
    assert_difference('Memebership.count', -1) do
      delete :destroy, id: @memebership
    end

    assert_redirected_to memeberships_path
  end
end
