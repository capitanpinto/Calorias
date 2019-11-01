class CalosController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @calo = current_user.calos.build(calo_params)
    if  @calo.qcal.nil?
      @calo.qcal=0
    elsif @calo.ncal.nil?
      @calo.ncal=0
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
    redirect_to request.referrer || root_url
  end
  private

    def calo_params
      params.require(:calo).permit(:coment, :ncal, :qcal)
    end
  
  
end
