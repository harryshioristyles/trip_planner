class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :list_title
      t.string :list_subtitle
      t.integer :list_index
      t.time :begin
      t.time :end
      t.integer :activity_id
      t.integer :trip_date_id

      t.timestamps
    end
  end
end
