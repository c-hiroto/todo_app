require "test_helper"

class TasksInterface < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    log_in_as(@user)
  end
end

class TasksInterfaceTest < TasksInterface

  test "should show errors but not create task on invalid submission" do
    assert_no_difference 'Task.count' do
      post tasks_path, params: { task: { title: "", state: false, due_date: "2023-02-09", priority: "☆☆☆☆☆", memo: "なるはや" } }
    end
    assert_select 'div#error_explanation'
  end

  test "should create a task on valid submission" do
    assert_difference 'Task.count', 1 do
      post tasks_path, params: { task: { title: "task1", state: false, due_date: "2023-02-09", priority: "☆☆☆☆☆", memo: "なるはや" } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match "task1", response.body
  end

  test "should have task delete links on own profile page" do
    get user_path(@user)
    assert_select 'a', text: 'delete'
  end

  test "should be able to delete own task" do
    first_task = @user.tasks.first
    assert_difference 'Task.count', -1 do
      delete task_path(first_task)
    end
  end
end
