class HomeController < ApplicationController
  before_action :set_user, only: %i[index]
  
  def index
  end

  private

  def set_user
    @user = user_signed_in? ? current_user : ''
  end

end
