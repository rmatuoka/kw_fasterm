class AddOderprodToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :orderprod, :integer
  end

  def self.down
    remove_column :products, :orderprod
  end
end
