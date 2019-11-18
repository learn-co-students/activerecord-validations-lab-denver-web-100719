class Post < ActiveRecord::Base
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :does_title_include

    def does_title_include
        errors.add(:title, "Post is invalid if not clickbait") unless
        title.present? && title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
    end



end
