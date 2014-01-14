class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :requester_id
      t.integer :show_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
