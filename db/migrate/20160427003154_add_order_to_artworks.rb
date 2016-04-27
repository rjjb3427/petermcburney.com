class AddOrderToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :order, :integer
  end
end
