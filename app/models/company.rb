class Company < ApplicationRecord
    has_many :missions
    has_many :docks, through: :missions
end
