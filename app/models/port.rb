class Port < ApplicationRecord
    has_many :missions, dependent: :destroy
    has_many :companies, through: :missions
    validates :title, :item, presence: true
    validates :title, length: {minimum: 2}
    validates :item, length: {minimum: 2}
    validates_associated :missions
    accepts_nested_attributes_for :missions

end