class User < ApplicationRecord
    has_many :pets, through: :favorites
    has_many :favorites
end
