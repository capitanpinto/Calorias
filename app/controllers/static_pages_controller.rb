class StaticPagesController < ApplicationController
  def home
    @calo = current_user.calos.build if user_signed_in?
  end

  def calories
  end
end
