class Project < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  paginates_per 5
end
