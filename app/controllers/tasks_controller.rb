class TasksController < ApplicationController

	def create
		if current_user.tasks.create (task_params)
      		@task = current_user.tasks.first
    else
      redirect_to root_url
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

  def check
    @task=current_user.tasks.find(params[:id])
    @task.update_attributes(:status => true)
    redirect_to root_url
  end

  def uncheck
    @task=current_user.tasks.find(params[:id])
    @task.update_attributes(:status => false)
    redirect_to root_url
  end

	private
    
    def task_params
      params.require(:task).permit(:name, :project_id)
    end
end
