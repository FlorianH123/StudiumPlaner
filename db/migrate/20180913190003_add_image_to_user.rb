class AddImageToUser < ActiveRecord::Migration[5.2]
  include Paperclip::Schema

  def self.up
    add_attachment :users, :image
  end

  def self.down
    remove_attachment :users, :image
  end
end
