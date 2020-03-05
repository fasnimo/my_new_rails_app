class Mission < ApplicationRecord
    belongs_to :dock, optional: true
    belongs_to :company, optional: true

    
end
