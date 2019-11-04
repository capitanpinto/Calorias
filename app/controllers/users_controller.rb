class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show, :index, :destroy]
    
  def index
    @users = User.all.page(params[:page])
  end

 def show    
      @member=User.find(params[:id])
      @calos = @member.calos.page(params[:page])
      @ddata=@member.calos.first(2)
      max=@member.calos.count - 1
      (2..max).each do |i|
        if @member.calos[i].created_at > Time.now - 60*60*24*30
          @ddata << @member.calos[i]
        end
      end
 end
end