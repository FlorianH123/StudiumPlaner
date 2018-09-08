class Grade < ApplicationRecord
  belongs_to :user
  validates :grade_value, :lecture, presence: { message: "Must be there"}

  validates :grade_value, numericality: { message: "Must be a number" }
end
