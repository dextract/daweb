class Company < ActiveRecord::Base
  has_many :users, through: :memberships
  has_many :memberships, foreign_key: "company_id"
  validates :name, uniqueness: { case_sensitive: false }, presence: true, length: { maximum: 50 }
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png", :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox_config.yml")
  default_scope { order('name') }
end
