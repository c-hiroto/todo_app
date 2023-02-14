class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @task = current_user.tasks.build
      @feed_items = current_user.tasks.where(is_done: false)
    end
  end

  def about
  end

  def contact
  end
end
