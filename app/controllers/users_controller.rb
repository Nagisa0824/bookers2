class UsersController < ApplicationController
 def create
   
 end

 def index
    
 end

 def show
     
 end

 def edit
     
 end

 def update
   
 end

 private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end