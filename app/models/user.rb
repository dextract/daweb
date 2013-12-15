class User < ActiveRecord::Base
  has_many :news
  has_many :companies, through: :memberships
  has_many :memberships, foreign_key: "user_id", dependent: :destroy
  has_many :contacts, foreign_key: "contact_id", dependent: :destroy
  has_many :contactee_users, through: :contacts, source: :contactee
  has_many :reverse_contacts, foreign_key: "contactee_id",
           class_name:  "Contact",
           dependent:   :destroy
  has_many :contactees, through: :reverse_contacts, source: :contact

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  has_secure_password
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png", :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox_config.yml")

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def member?(company)
    memberships.find_by(company_id: company.id)
  end

  def member!(company, owner, ex)
    memberships.create!(company_id: company.id, owner: owner, ex: ex)
  end

  def unmember!(company)
    memberships.find_by(company_id: company.id).destroy!
  end

  def contacting?(other_user)
    contacts.find_by(contactee_id: other_user.id)
  end

  def contact!(other_user, pending)
    contacts.create!(contactee_id: other_user.id, pending: pending)
  end

  def uncontact!(other_user)
    contacts.find_by(contactee_id: other_user.id).destroy!
  end


  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end