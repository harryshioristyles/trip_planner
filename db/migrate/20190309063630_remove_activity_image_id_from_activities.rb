class RemoveActivityImageIdFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :activity_image_id, :string
  end
end
