class Chart < ApplicationRecord
    validates :chart_title, presence: true
    validates :chart_data, presence: true
    has_and_belongs_to_many :profiles
end
