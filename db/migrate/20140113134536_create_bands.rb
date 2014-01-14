class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.string :hometown_city
      t.string :hometown_state
      t.string :website
      t.string :image_url
      t.string :genre
      t.integer :user_id

      t.timestamps
    end
  end
end
