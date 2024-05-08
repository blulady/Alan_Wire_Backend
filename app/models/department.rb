class Department < ApplicationRecord
    validates :department_name, presence: true
    has_and_belongs_to_many :profiles
end