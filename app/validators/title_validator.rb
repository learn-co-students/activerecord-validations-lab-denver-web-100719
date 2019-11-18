class TitleValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        record.errors.add(attribute, "Post is invalid if not clickbait") unless 
        value.present? && value.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
    end 
end 