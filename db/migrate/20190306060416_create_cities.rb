class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :city_name
      t.integer :country_id

      t.timestamps
    end
  end
end
