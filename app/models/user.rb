class User < ApplicationRecord
    has_secure_password
    has_many :articles
    
    validates :first_name, length: { minimum: 3, maximum: 30 }
    validates :last_name, length: { minimum: 3, maximum: 30 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :age, numericality: { in: 5..150 }

    before_validation :trim_data

    def trim_data
        self.first_name = first_name.strip
        self.last_name = last_name.strip
        self.email = email.strip
    end
end
