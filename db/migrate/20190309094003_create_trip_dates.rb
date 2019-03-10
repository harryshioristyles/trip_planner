class CreateTripDates < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_dates do |t|
      t.integer :day_index
      t.date :date
      t.integer :trip_id

      t.timestamps
    end
  end
end
