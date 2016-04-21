class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image_url
      t.boolean :featured
      t.string :image_type
      t.string :location

      t.timestamps null: false
    end
  end
end
