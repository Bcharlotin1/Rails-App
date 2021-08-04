class Game < ApplicationRecord
    has_many :reviews
    has_many :users, :through => :reviews
    belongs_to :category 

    # accepts_nested_attributes_for :category

    validates :title, presence: true, uniqueness: {case_sensitive: false}
    validates :image, presence:  { message: "Please enter a image URL" }
    validates :description, presence:  { message: "Please enter a description" }

    def category_attributes=(hash_attr)
        if !hash_attr[:name].blank?
            self.category = Category.find_or_create_by(hash_attr)
        end

    end

    #custom wirther that takes up for the  accepts nesteed attributes,  thsi prevents duplication
    #it is her becaue you cna only create a ne category thro creating anew game

    
    scope :ordered_by_title, -> { order(title: :asc) }
    scope :search_game, ->(search) {where("title LIKE ?", "%" + "#{search}" + "%")}
    #Scopes are custom queries that you define inside your Rails models with the scope method.


end
