class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :country_name
      t.integer :area

      t.timestamps
    end
  end
end
