class User < ApplicationRecord

    has_secure_password #authenticate, password = (can pass pasword _digest as jsut password),  and validates
    has_many :reviews
    has_many :games, :through => :reviews

    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
  
    
    
end
