class Task < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :due_date, presence: true
  validates :priority, presence: true, numericality: { in: 1..5 }
  validates :memo, length: { maximum: 140 }
end
