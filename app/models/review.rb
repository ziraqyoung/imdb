class Review < ApplicationRecord
    
    #associations
    belongs_to :user
    belongs_to :play

    #validations
    validates :comment, presence: true
end
