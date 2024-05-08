class Profile < ApplicationRecord
  validates :employee_number, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  belongs_to :user
  has_and_belongs_to_many :departments
  has_and_belongs_to_many :positions
end
