class TasksController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

    def create
      @task = current_user.tasks.build(task_params)
      if @task.save
        flash[:success] = "Task created!"
        redirect_to root_url
      else
        @feed_items = current_user.tasks.where(state: false)
        render 'static_pages/home', status: :unprocessable_entity
      end
    end
    
    def destroy
        @task.destroy
        flash[:success] = "Task deleted"
        if request.referrer.nil?
          redirect_to root_url, status: :see_other
        else
          redirect_to request.referrer, status: :see_other
        end
    end
    
    private
    
        def task_params
          params.require(:task).permit(:title, :state, :due_date, :priority, :memo)
        end

        def correct_user
          @task = current_user.tasks.find_by(id: params[:id])
          redirect_to root_url, status: :see_other if @task.nil?
        end
end
