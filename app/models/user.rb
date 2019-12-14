class User < ApplicationRecord
    has_many :articles;
    before_save {self.email = email.downcase}

    validates :user, presence: true, 
    uniqueness: {case_sensitive: false}, 
    length: {minimum:3, maximum:20}

    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
    uniqueness: {case_sensitive: false},
    format: {with: EMAIL_REGEX}

end