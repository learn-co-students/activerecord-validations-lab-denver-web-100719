class Post < ActiveRecord::Base
    belongs_to :author
    # validates :title, presence: true 
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait 

    def clickbait 
        errors.add(:title, 'error') unless 
            title.present? && title.include?("Won't Believe" || "Secret" || "Top[number]" || "Guess")
    end 
end

