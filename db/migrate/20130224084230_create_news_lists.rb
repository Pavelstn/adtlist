class CreateNewsLists < ActiveRecord::Migration
  def change
    create_table :news_lists do |t|
      t.integer :user_id
      t.string :title
      t.string :short_text
      t.text :text
      t.string :img_url

      t.timestamps
    end
  end
end
