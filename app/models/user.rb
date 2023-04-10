class User < ApplicationRecord
  rolify
  belongs_to :organization
  has_many :leaves
  has_many :daily_updates
  has_many :projects

  after_create :assign_default_role
  paginates_per 5
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name,presence: true, uniqueness: true,length: { minimum: 4, maximum: 254 }
  validates :phone, numericality: { only_integer: true }, length: { is: 10 }, allow_blank: true
  validates :email,presence: true,format: { with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Email invalid"  },
      uniqueness: { case_sensitive: false },length: { minimum: 4, maximum: 254 }
  validates :password,presence: true
  validates :salary,length: { maximum: 4 }, allow_blank: true

  def assign_default_role
    self.add_role(:employee) if self.roles.blank?
  end

  def is_admin?
    has_role?(:admin)
  end

  
end
