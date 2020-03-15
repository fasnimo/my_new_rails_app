class Company < ApplicationRecord
    has_many :missions
    has_many :ports, through: :missions
    has_secure_password
end
