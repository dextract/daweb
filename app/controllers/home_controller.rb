class HomeController < ApplicationController
  def index
  end

  def about
  end


  def search
    if params[:query]
      @users_found = User.find_by_name(params[:query])
    else
      @users_found = []
    end
  end

end
