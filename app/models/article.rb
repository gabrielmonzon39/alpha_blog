class Article < ApplicationRecord
    validates :title, presence:true, length: { minimum:3, maximum:20}
    validates :description, presence:true, length: { minimum:3, maximum:200}
end