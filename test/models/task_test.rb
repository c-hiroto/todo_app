require "test_helper"

class TaskTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @task = @user.tasks.build(title: "task1", is_done: false, due_date: "2023-02-09", priority: 4, memo: "なるはや")
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "user id should be present" do
    @task.user_id = nil
    assert_not @task.valid?
  end

  test "title should be present" do
    @task.title = "   "
    assert_not @task.valid?
  end

  test "due_date should be present" do
    @task.due_date = "   "
    assert_not @task.valid?
  end

  test "priority should be present" do
    @task.priority = "   "
    assert_not @task.valid?
  end

  test "memo should be at most 140 characters" do
    @task.memo = "a" * 141
    assert_not @task.valid?
  end

  test "memo allows empty" do
    @task.memo = ""
    assert @task.valid?
  end
end
