class Department < ApplicationRecord
    validates :department_name, presence: true, uniqueness: true
    has_and_belongs_to_many :profiles
    has_and_belongs_to_many :charts
end
