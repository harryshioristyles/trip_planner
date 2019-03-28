class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :activity_name
      t.text :description
      t.integer :city_id
      t.string :activity_image_id

      t.timestamps
    end
  end
end
