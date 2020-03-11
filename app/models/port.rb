class Port < ApplicationRecord
    has_many :missions, dependent: :destroy
    has_many :companies, through: :missions

    validates_associated :missions
    accepts_nested_attributes_for :missions

    def complete
        self.missions.where(complete: true)
    end 


    def imcomplete
        self.missions.where(complete: false)
    end 
end
