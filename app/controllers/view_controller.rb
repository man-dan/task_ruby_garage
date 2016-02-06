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
      respond_to do |format|
        format.js
    end
  else
      respond_to do |format|
        format.js
    end
  end
end
def destroy
    if current_user.projects.find(params[:id]).destroy
    	respond_to do |format|
        format.js
      end
    end
end

def edit
   if @project=current_user.projects.find(params[:id])
        respond_to do |format|
          format.js
      end
    else
        respond_to do |format|
          format.js
        end
    end
end

def update
    @project=current_user.projects.find(params[:id])
    if @project.update_attributes(:title => params[:title])
    	 respond_to do |format|
          format.js
      end
    else
      respond_to do |format|
          render 'edit'
          format.js
      end
    end
  end
end