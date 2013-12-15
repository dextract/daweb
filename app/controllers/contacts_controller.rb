class ContactsController < ApplicationController
  def destroy
    Contact.find_by_contactee_id(params[:contactee_id]).destroy
    redirect_to home_contacts_path
    flash[:success] = "Contacto removido"
  end

  def reject_contact
    Contact.find_by_contactee_id(params[:contactee_id]).destroy
    redirect_to home_contacts_path
    flash[:success] = "Contacto rejeitado"
  end

  def accept_contact
    Contact.find_by_contactee_id(params[:contactee_id]).update_attribute(:pending, 'false')
    redirect_to home_contacts_path
    flash[:success] = "Contacto aceite"
  end


  private

end