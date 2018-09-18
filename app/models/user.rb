class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :events
  has_many :grades

  has_attached_file :image, :path => ":rails_root/public/system/:attachment/:username.:extension",
                    style: { medium: "100x100>"}, default_url: ActionController::Base.helpers.asset_path("default-avatar.png")
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
