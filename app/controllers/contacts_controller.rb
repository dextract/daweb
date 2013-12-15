class ContactsController < ApplicationController
  def destroy
    Contact.where(pending: false, contact_id: params[:contact_id], contactee_id: params[:contactee_id]).first.destroy
    redirect_to home_contacts_path
    flash[:success] = "Contacto removido"
  end

  def reject_contact
    Contact.where(pending: true, contact_id: params[:contact_id], contactee_id: params[:contactee_id]).first.destroy
    redirect_to home_contacts_path
    flash[:success] = "Contacto rejeitado"
  end

  def accept_contact
    Contact.where(pending: true, contact_id: params[:contact_id], contactee_id: params[:contactee_id]).first.update_attribute(:pending, 'false')
    redirect_to home_contacts_path
    flash[:success] = "Contacto aceite"
  end


  private

end