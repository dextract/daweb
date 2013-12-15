class HomeController < ApplicationController
  before_action :signed_in_user, only: [:contacts, :update, :index, :show]
  def index
  end

  def contacts
  end

  def about
  end

  def contact



    if params[:commit]
      @user = User.find(params[:user][:id])
      current_user.contact!(@user,true)
      redirect_to home_contact_path, notice: "Contacto enviado."
    end
  end

  def search
    if params[:query]
      @users_found = User.where("name LIKE (?)", "%#{params[:query]}%").paginate(:page => params[:page])
      @companies_found = Company.where("name LIKE (?)", "%#{params[:query]}%").paginate(:page => params[:page])
    else
      @users_found = []
      @companies_found = []
    end
  end

  private


  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end


end
