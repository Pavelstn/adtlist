# This migration comes from adtadmin (originally 20130706054214)
class AddOrderToRegions < ActiveRecord::Migration
  def change
  	add_column :adtadmin_regions, :rorder, :integer
  end
end
