class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :post_id
      t.integer :visittype

      t.timestamps
    end
  end
end
