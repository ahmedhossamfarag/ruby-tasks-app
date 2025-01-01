class TaskNote < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :title, presence: true, length: { maximum: 20 }
  validate :validates_title_length
  validates :priority, presence: true
  validates :due_date, presence: true, comparison: { greater_than_or_equal_to: DateTime.now }

  enum :priority, [ :low, :medium, :high ], validate: true

  def validates_title_length
    length = title.gsub(" ", "").length
    errors.add(:title, "is too short (minimum is 3 characters)") unless length >= 3
  end
end
