class Grade < ApplicationRecord
  belongs_to :user
  validates :grade_value, :lecture, presence: true
end
