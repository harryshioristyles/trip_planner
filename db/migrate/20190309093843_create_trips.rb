class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :trip_title
      t.string :trip_subtitle
      t.integer :check_finish
      t.integer :user_id

      t.timestamps
    end
  end
end
