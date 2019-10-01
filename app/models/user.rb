class User < ApplicationRecord
    has_secure_password
    validates :username, :uniqueness => {:case_sensitive => false}
    has_many :pets, through: :favorites
    has_many :favorites
end
