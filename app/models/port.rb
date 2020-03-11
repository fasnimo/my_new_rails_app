class Port < ApplicationRecord
    has_many :missions
    has_many :companies, through: :missions
    accepts_nested_attributes_for :missions, allow_destroy: true
end
