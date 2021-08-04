class Review < ApplicationRecord
    belongs_to :user
    belongs_to :game
#macro
    validates :content, presence: true


end
