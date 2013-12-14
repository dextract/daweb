class HomeController < ApplicationController
  def index
  end

  def about
  end

  def search
    if params[:query]
      @users_found = User.where("name LIKE (?)", "%#{params[:query]}%").paginate(:page => params[:page])
    else
      @users_found = []
    end
  end

end
