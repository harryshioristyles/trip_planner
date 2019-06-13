class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :list_title
      t.string :list_details
      t.integer :day_index, default:1
      t.date :date
      t.time :begin
      t.time :end
      t.integer :city_id
      t.integer :activity_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
