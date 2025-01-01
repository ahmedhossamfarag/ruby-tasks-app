require "test_helper"

class TaskNoteTest < ActiveSupport::TestCase
  test "test title presence" do
    task_note = TaskNote.new(user_id: 1, title: "i  d", priority: :low, due_date: "1-1-2080")
    assert_not task_note.valid?, task_note.errors.full_messages.to_s
  end

  test "test due date in future" do
    task_note = TaskNote.new(user_id: 1, title: "task", priority: :high, due_date: "1-1-2020")
    assert_not task_note.valid?, task_note.errors.full_messages.to_s
  end
end
