class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :is_clickbait?

    def is_clickbait?
        if self.title.present? && self.title.include?( "Won't Believe")
            true
        elsif self.title.present? && self.title.include?( "Secret")
            true
        elsif self.title.present? && self.title.include?( "Top [number]")
            true
        elsif self.title.present? && self.title.include?( "Guess")
            true
        else
            errors.add(:title, "Not Clickbait, try new title")
        end
    end
end
