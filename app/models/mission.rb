class Mission < ApplicationRecord
    belongs_to :port, optional: true
    belongs_to :company, optional: true
    validates :ship, presence: {message: "Need shipment info."}
    validates :ship, length: {maximum: 25, too_long: "Characters maximum is 25"}
    validates :ship, length: {minimum: 2 }    
    scope :complete, -> {where(complete: true)}
 
end
