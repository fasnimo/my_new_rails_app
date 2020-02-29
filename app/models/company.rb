class Company < ApplicationRecord
    has_many :missions
    has_many :docks, through: :missions
    has_secure_password

    def self.from_omniauth(user_info)
        where(email: user_info.info.email).first_or_intialize do |u|
            u.name = user_info.name
            u.password = SecureRandom.hex
        end 

    end 
end
