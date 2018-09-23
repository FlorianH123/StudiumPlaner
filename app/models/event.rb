class Event < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'events_users'

  validates :place, presence: true
  validates :title, presence: true
  validates :date_from, presence: true
  validates :date_to, presence: true
  validates_datetime :date_from, :after => lambda { DateTime.current }
  validates_datetime :date_to, :after => lambda { DateTime.current }
  validates_datetime :date_to, :after => :date_from
end
