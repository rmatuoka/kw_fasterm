class AddGraphicDisplayToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :graphic_display, :boolean
  end

  def self.down
    remove_column :categories, :graphic_display
  end
end
