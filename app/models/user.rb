class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_length_of :username, maximum: 20
  validate :validates_username_length
  has_many :task_notes, dependent: :destroy

  def validates_username_length
    length = username.gsub(" ", "").length
    errors.add(:username, "is too short (minimum is 3 characters)") unless length >= 3
  end
end
