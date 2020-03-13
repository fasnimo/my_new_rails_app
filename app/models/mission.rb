class Mission < ApplicationRecord
    belongs_to :port, optional: true
    belongs_to :company, optional: true
    
    scope :complete, -> {where(complete: true)}

    

    
end
