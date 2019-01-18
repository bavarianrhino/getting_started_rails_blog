class Article < ApplicationRecord
    # Manually added below "has_many :comments" after creating/migrating comments
    # dependent: :destroy will delete all comments associated with article, if article is deleted
    has_many :comments, dependent: :destroy

    validates :title, presence: true, length: { minimum: 5 }
    validates :text, presence: true, length: { minimum: 5 }
end
