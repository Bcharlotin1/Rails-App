class Category < ApplicationRecord
    has_many :games
   validates :name, presence: true, uniqueness: {case_sensitive: false}
end
