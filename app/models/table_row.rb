class TableRow < ApplicationRecord
  belongs_to :time_table

  validates :period, presence: true
end
