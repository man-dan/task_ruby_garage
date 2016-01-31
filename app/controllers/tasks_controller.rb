class TasksController < ApplicationController

	def create
		if current_user.tasks.create!(task_params)
      		@task = current_user.tasks.first
      	end
      	if @task.save
      		redirect_to root_url
    	end
	end

  def edit
      @task=current_user.tasks.find(params[:id])
  end

  def update
    @task=current_user.tasks.find(params[:id])
    if @task.update_attributes(:name => params[:name])
      redirect_to root_url
    else
      render 'edit'
    end
 
  end

  def destroy
    if current_user.tasks.find(params[:id]).destroy
      redirect_to root_url
    end
  end

	private
    
    def task_params
      params.require(:task).permit(:name, :project_id)
    end
end
