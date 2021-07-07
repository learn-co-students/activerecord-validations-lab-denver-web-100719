require 'pry'

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }    
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :click_bait_valid

    def click_bait_valid
        if title
        if title.exclude?("Won't Believe" || "Secret" || "Top [Number]" || "Guess")
            # binding.pry
            errors.add(:title, "Must be Clickbait")
        end
        end
    end
end

