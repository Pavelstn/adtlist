class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :typereview_id
      t.string :name
      t.string :phone
      t.string :adress
      t.text :description
      t.integer :post_id

      t.timestamps
    end
  end
end
