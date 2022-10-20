class RemoveImagesFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :image, :text
    add_column :products, :image, :text
  end
end
