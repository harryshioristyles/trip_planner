class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :trip_title
      t.string :trip_details
      t.integer :checking_finish, null: false, default:0, limit: 1
      t.integer :user_id

      t.timestamps
    end

    add_index :trips, :trip_title

  end
end
