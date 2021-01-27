class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
    validates :name, presence: true, uniqueness: true


    def mood
        nausea > happiness ? "sad" : "happy"
    end 
end
