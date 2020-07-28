class AddProfileImagesIdToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :profile_images_id, :attachment
  end
end
