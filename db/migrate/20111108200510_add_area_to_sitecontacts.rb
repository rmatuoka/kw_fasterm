class AddAreaToSitecontacts < ActiveRecord::Migration
  def self.up
    add_column :sitecontacts, :area, :string
  end

  def self.down
    remove_column :sitecontacts, :area
  end
end
