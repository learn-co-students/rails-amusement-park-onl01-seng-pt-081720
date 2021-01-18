class User < ApplicationRecord
    has_many :rides
    has_many :attractions, through: :rides
    validates :password, presence: true

    def mood
        if self.admin == false
            if self.nausea > self.happiness
                return "sad"
            else
                return "happy"
            end
        end
    end
end
