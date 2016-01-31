class ViewController < ApplicationController
  
 before_action :signed_in_user

 def index
 	 @projects=current_user.projects.all
   @tasks=current_user.tasks.all
   @task=current_user.tasks.new
 end
 
 def create
 	if current_user.projects.create!(title: "New list")
      @project=current_user.projects.first
      @tasks=current_user.tasks.all
      @task=current_user.tasks.new
  	end
	
	if @project.save
      redirect_to root_url
    end
end
def destroy
    if current_user.projects.find(params[:id]).destroy
    	redirect_to root_url
    end
end

def edit
   @project=current_user.projects.find(params[:id])

end

def update
    @project=current_user.projects.find(params[:id])
    if @project.update_attributes(:title => params[:title])
    	redirect_to root_url
    else
      render 'edit'
    end
  end
end