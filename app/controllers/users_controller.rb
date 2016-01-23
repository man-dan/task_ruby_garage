class UsersController < ApplicationController
  
  def new
    if signed_in?
      redirect_to root_url
    end
  	 @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password,:password_confirmation)

    end
end

