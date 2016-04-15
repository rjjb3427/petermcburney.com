class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :image_url
      t.boolean :featured
      t.boolean :for_sale
      t.string :artwork_type
      t.string :media
      t.string :size
      t.string :price

      t.timestamps null: false
    end
  end
end
