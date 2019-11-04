class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show, :index, :destroy]
    
  def index
    @users = User.all.page(params[:page])
  end

 def show    
   if current_user
     @user = current_user
     @member=User.find(params[:id])
     @calos = @member.calos.page(params[:page])
     @data={}
     @qdata={}
     @member.calos.each do |calo|
       @data["#{calo.created_at}"]=calo.ncal
     end
     @member.calos.each do |calo|
       @data["#{calo.created_at}"]=calo.qcal
     end
   else
     redirect_to new_user_session_path, notice: 'Usted no ha abierto cesion.'
   end
 end
end