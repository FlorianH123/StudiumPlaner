class Grade < ApplicationRecord
  belongs_to :user
  validates :grade_value, :lecture, presence: { message: "must be present"}

  validates :grade_value, numericality: { message: "Must be a number" }
  validates :grade_value, numericality: {:greater_than_or_equal_to => 1.0, message: I18n.t('grades.grade_greater_1')}
  validates :grade_value, numericality: {:less_than_or_equal_to => 4.0, message: I18n.t('grades.grade_less_4')}

end
