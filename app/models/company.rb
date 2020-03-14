class Company < ApplicationRecord
    has_many :missions
    has_many :ports, through: :missions
    has_secure_password
    # validates :name, presence: true

    # def self.from_omniauth(user_info)
    #     where(name: user_info.info.name).first_or_intialize do |u|
    #         u.name = user_info.name
    #         u.password = SecureRandom.hex
    #     end 

    # end 
end
