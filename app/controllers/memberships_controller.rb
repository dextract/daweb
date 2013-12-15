class MembershipsController < ApplicationController
  def destroy
     Membership.find_by_user_id(params[:user_id]).update_attribute(:ex, 'true')
     Company.find(params[:company]).memberships.find_by_user_id(params[:user_id]).update_attribute(:ex, 'true')
     redirect_to company_path(params[:company])
     flash[:success] = "Colaborador removido"
  end

  def remove_pres
    Membership.find_by_user_id(params[:user_id]).update_attribute(:owner, 'false')
    Company.find(params[:company]).memberships.find_by_user_id(params[:user_id]).update_attribute(:owner, 'false')
    redirect_to user_path(params[:user_id])
    flash[:success] = "Presidência removida"
  end


  private

end