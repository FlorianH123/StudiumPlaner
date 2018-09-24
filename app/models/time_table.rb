class TimeTable < ApplicationRecord
  belongs_to :user

  has_many :table_rows
  accepts_nested_attributes_for :table_rows
end
