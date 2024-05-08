class Position < ApplicationRecord
    validates :position_title, presence: true
    has_and_belongs_to_many :profiles

end
