require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_create_url
    assert_response :success
  end

  test "should post create" do
    post users_create_url
    assert_redirected_to users_create_url, status: :bad_request
    post users_create_url, params: { user: { username: "username", password: "password" } }
    assert_redirected_to task_notes_index_url
  end

  test "should get login" do
    get users_login_url
    assert_response :success
  end

  test "should post login" do
    post users_login_url
    assert_redirected_to users_login_url, status: :bad_request
    user = User.create(username: "user_test", password: "password")
    post users_login_url, params: { user: { username: user.username, password: "password" } }
    assert_redirected_to task_notes_index_url
  end

  test "should get logout" do
    get users_logout_url
    assert_redirected_to users_login_url
  end
end
