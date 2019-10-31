class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show, :index]
    
  def index
    @users = User.all
  end

 def show    
   if current_user
     @user = current_user
   else
     redirect_to new_user_session_path, notice: 'Usted no ha abierto cesion.'
   end
 end
end