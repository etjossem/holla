class AddOwnerToChannel < ActiveRecord::Migration
  def self.up
    add_column :channels, :owner, :string
  end

  def self.down
    remove_column :channels, :owner
  end
end
