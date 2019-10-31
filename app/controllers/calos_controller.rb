class CalosController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @calo = current_user.calos.build(calo_params)
    if @calo.save
      flash[:success] = "Se ha registrado tu uso calorias!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def calo_params
      params.require(:calo).permit(:coment, :ncal, :qcal)
    end
  
  
end
