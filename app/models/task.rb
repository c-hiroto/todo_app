class Task < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :due_date, presence: true
  validates :priority, presence: true
  validates :memo, length: { maximum: 140 }
end
