class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.date :date
      t.string :time
      t.integer :venue_id
      t.integer :band_id
      t.integer :slots_open

      t.timestamps
    end
  end
end
