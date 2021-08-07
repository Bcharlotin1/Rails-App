class Game < ApplicationRecord
    has_many :reviews
    has_many :users, :through => :reviews
    belongs_to :category 

    validates :title, presence: true, uniqueness: {case_sensitive: false}
    validates :image, presence:  { message: "Please enter a image URL" }
    validates :description, presence:  { message: "Please enter a description" }

    scope :ordered_by_title, -> { order(title: :asc) }
    scope :search_game, ->(search) {where("title LIKE ?", "%" + "#{search}" + "%")}

    def category_attributes=(hash_attr)
        if !hash_attr[:name].blank?
            self.category = Category.find_or_create_by(hash_attr)
        end

    end

end
