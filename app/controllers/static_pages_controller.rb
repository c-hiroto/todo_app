class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @task = current_user.tasks.build
      @feed_items = params[:tag_id].present? ? Tag.find(params[:tag_id]).tasks.where(is_done: false) : Task.all.where(is_done: false)

    end
  end

  def about
  end

  def contact
  end
end
