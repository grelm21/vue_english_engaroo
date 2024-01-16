require "test_helper"

class MatchingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get matchings_new_url
    assert_response :success
  end

  test "should get create" do
    get matchings_create_url
    assert_response :success
  end

  test "should get edit" do
    get matchings_edit_url
    assert_response :success
  end

  test "should get update" do
    get matchings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get matchings_destroy_url
    assert_response :success
  end
end
