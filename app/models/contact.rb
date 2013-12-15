class Contact < ActiveRecord::Base
  belongs_to :contact, class_name: "User"
  belongs_to :contactee, class_name: "User"
  validates :contact_id, presence: true
  validates :contactee_id, presence: true
end
