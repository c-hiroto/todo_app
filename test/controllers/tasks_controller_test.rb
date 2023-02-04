require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @task = tasks(:Task3)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Task.count' do
      post tasks_path, params: { task: { title: "task1", state: false, due_date: "2023-02-09", priority: "☆☆☆☆☆", memo: "なるはや" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Task.count' do
      delete task_path(@task)
    end
    assert_response :see_other
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong task" do
    log_in_as(users(:michael))
    task = tasks(:Task4)
    assert_no_difference 'Task.count' do
      delete task_path(task)
    end
    assert_response :see_other
    assert_redirected_to root_url
  end
end
