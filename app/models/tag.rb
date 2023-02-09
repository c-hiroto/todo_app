class Tag < ApplicationRecord
    has_many :tag_relationships, dependent: :destroy
    has_many :tasks, through: :tag_relationships, dependent: :destroy
end
