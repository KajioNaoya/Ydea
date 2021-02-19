require 'test_helper'

class YoutubersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get youtubers_index_url
    assert_response :success
  end

  test "should get show" do
    get youtubers_show_url
    assert_response :success
  end

  test "should get new" do
    get youtubers_new_url
    assert_response :success
  end

  test "should get edit" do
    get youtubers_edit_url
    assert_response :success
  end

end
