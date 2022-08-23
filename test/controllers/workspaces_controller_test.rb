require "test_helper"

class WorkspacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get workspaces_index_url
    assert_response :success
  end

  test "should get show" do
    get workspaces_show_url
    assert_response :success
  end

  test "should get new" do
    get workspaces_new_url
    assert_response :success
  end

  test "should get create" do
    get workspaces_create_url
    assert_response :success
  end
end
