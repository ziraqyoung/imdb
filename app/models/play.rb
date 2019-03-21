class Play < ApplicationRecord

    #associations
    belongs_to :user
    belongs_to :category
    has_many :reviews, dependent: :destroy
    
    has_one_attached :play_img

    def play_index
        return self.play_img.variant(resize: '450x550')
    end

    def play_show
        return self.play_img.variant(resize: '525x675')
    end

    #validations
    validates :title, presence: true
    validates :description, presence: true
    
    #scopes
    scope :newest, lambda { order("created_at DESC") }
end
