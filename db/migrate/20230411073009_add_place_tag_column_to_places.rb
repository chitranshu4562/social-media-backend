class AddPlaceTagColumnToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :places, :place_tag, :string
  end
end
