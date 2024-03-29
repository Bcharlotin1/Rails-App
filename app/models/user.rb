class User < ApplicationRecord
    has_secure_password 
    has_many :reviews, dependent: :destroy
    has_many :games, :through => :reviews

    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
  
end
