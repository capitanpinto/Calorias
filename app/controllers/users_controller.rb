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
     @data=[{:name=>"Calorias Consumidas",:datos=>{}},
            {:name=>"Calorias Gastadas",:datos=>{}}]
     @member.calos.first(3).each do |calo|
       @data[0][:datos]["#{calo.created_at}"]=calo.ncal
       @data[1][:datos]["#{calo.created_at}"]=calo.qcal
     end
   else
     redirect_to new_user_session_path, notice: 'Usted no ha abierto cesion.'
   end
 end
end