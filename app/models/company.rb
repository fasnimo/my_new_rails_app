class Company < ApplicationRecord
    has_many :missions
    has_many :ports, through: :missions
    validates :name, :password, presence: true
    validates :name, uniqueness: true
    has_secure_password


    def self.find_or_create_by_omniauth(user_info)
        self.where(:name => user_info['info']['nickname']).first_or_create do |company|
         company.password = SecureRandom.hex 
        end
    end 
end
