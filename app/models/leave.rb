class Leave < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  enum :leave_type, { Occasional: 0, Medical: 1, Personal: 2, Emergency: 3, Governmnet: 4, Maternity: 5}
  enum :status, [:pending, :approved, :rejected]
  paginates_per 5

  def status?
    status == 'pending'
  end
end
