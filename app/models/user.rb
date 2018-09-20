class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :events, class_name: 'Event', join_table: :events_participants
  has_many :grades

  has_attached_file :image, default_url: ActionController::Base.helpers.asset_path("default-avatar.png")
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
