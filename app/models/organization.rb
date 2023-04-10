class Organization < ApplicationRecord
  has_many :users
  has_many :leaves
  has_many :daily_updates
  has_many :projects
  validates :name, uniqueness: true, presence: true
end
