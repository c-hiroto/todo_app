class Task < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :due_date, presence: true
  validates :priority, presence: true
  validates :memo, length: { maximum: 140 }
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships, dependent: :destroy
end
