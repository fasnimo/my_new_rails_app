class Dock < ApplicationRecord
    has_many :missions
    has_many :companies, through: :missions
end
