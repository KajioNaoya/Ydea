require 'test_helper'

class Admin::YoutubersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_youtubers_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_youtubers_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_youtubers_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_youtubers_index_url
    assert_response :success
  end

end
