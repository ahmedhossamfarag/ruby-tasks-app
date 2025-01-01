require "test_helper"

class TaskNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = User.create(username: "task_test", password: "password")
    post users_login_url, params: { user: { username: user.username, password: "password" } }
    @task_note = TaskNote.create(user_id: user.id, title: "test", priority: :high, due_date: "1-1-2080")
  end

  test "should get index" do
    get task_notes_index_url
    assert_response :success
  end

  test "should get create" do
    get task_notes_create_url
    assert_response :success
  end

  test "should post create" do
    post task_notes_create_url
    assert_redirected_to task_notes_create_url, status: :bad_request
    post task_notes_create_url, params: { task_note: { title: "task", priority: :low, due_date: "1-1-2080" } }
    assert_redirected_to task_notes_index_url
  end

  test "should get edit" do
    get task_notes_edit_url
    assert_response :bad_request
    get task_notes_edit_url, params: { id: @task_note.id }
    assert_response :success
  end

  test "should patch edit" do
    patch task_notes_edit_url, params: { id: @task_note.id }
    assert_redirected_to task_notes_edit_url, status: :bad_request
    patch task_notes_edit_url, params: { id: @task_note.id, task_note: { priority: :high } }
    assert_redirected_to task_notes_index_url
  end

  test "should get delete" do
    get task_notes_delete_url
    assert_response :bad_request
    get task_notes_delete_url, params: { id: @task_note.id }
    assert_redirected_to task_notes_index_url
  end
end
