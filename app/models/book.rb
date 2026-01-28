class Book < ApplicationRecord
    validates :title, presence: true, length: { minimum: 1 }
    validates :author, presence: true, length: { minimum: 1 }
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validate :published_date_cannot_be_in_the_future

    def published_date_cannot_be_in_the_future
        if published_date.present? && published_date > Date.today
            errors.add(:published_date, "can't be in the future")
        end
    end
end