class AddActiveStatusToNewslist < ActiveRecord::Migration
  def change
  	add_column :news_lists, :isdelete, :boolean
  	add_column :news_lists, :isactive, :boolean
  end
end
