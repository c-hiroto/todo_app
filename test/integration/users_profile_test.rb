require "test_helper"

class UsersProfileTest < ActionDispatch::IntegrationTest
  #full_title helperの利用のため
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "profile display" do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_match @user.tasks.where(state: true).count.to_s, response.body
    assert_select 'div.pagination'
    @user.tasks.where(state: true).paginate(page: 1).each do |task|
      assert_match task.title, response.body
      assert_match "Undone", response.body
      assert_match "Delete this Task", response.body
    end
  end
end