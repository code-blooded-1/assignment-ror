class Article < ApplicationRecord
    belongs_to :user

    validates :title, presence: true, length: { minimum: 5, maximum: 100}
    validates :body, presence: true, length: { minimum: 5, maximum: 1000}

    before_validation :trim_data

    def trim_data
        self.title = title.strip
        self.body = body.strip
    end
end
