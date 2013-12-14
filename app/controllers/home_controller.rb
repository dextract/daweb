class HomeController < ApplicationController
  def index
  end

  def about
  end

  def search
    if params[:query]
      @users_found = User.where("name LIKE (?)", "%#{params[:query]}%")
    else
      @users_found = []
    end
  end

end
