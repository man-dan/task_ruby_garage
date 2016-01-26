class ViewController < ApplicationController
  
 before_action :signed_in_user

 def index
 	 @projects=current_user.projects.all
 end
 
 def create
 	if current_user.projects.create!(name: "New list")
      @project=current_user.projects.first
  	end
 end
end