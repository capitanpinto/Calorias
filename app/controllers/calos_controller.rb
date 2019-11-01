class CalosController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @calo = current_user.calos.build(calo_params)
    if  @calo.qcal.nil?
      @calo.qcal=0
    elsif @calo.ncal.nil?
      @calo.ncal=0
    end
    
  def search
   if params[:search].blank?  
     redirect_to(root_path, alert: "Empty field!") and return  
   else  
   @parameter = params[:search].downcase  
   @results = Calo.all.where("lower(coment) LIKE :search", search: @parameter) 
   end
  end
    
    if @calo.save
      flash[:success] = "Se ha registrado tu uso calorias!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @cal=Calo.find_by(params[:user_id])
    @cal.destroy
    flash[:success] = "El registro fue eliminado!"
    flash[:danger] = "Useted no tiene permiso de eliminar el resgitro!"
    redirect_to request.referrer || root_url
  end
  private

    def calo_params
      params.require(:calo).permit(:coment, :ncal, :qcal)
    end
  
  
end
