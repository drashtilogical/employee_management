require "test_helper"

class DailyUpdatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_update = daily_updates(:one)
  end

  test "should get index" do
    get daily_updates_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_update_url
    assert_response :success
  end

  test "should create daily_update" do
    assert_difference("DailyUpdate.count") do
      post daily_updates_url, params: { daily_update: {  } }
    end

    assert_redirected_to daily_update_url(DailyUpdate.last)
  end

  test "should show daily_update" do
    get daily_update_url(@daily_update)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_update_url(@daily_update)
    assert_response :success
  end

  test "should update daily_update" do
    patch daily_update_url(@daily_update), params: { daily_update: {  } }
    assert_redirected_to daily_update_url(@daily_update)
  end

  test "should destroy daily_update" do
    assert_difference("DailyUpdate.count", -1) do
      delete daily_update_url(@daily_update)
    end

    assert_redirected_to daily_updates_url
  end
end
