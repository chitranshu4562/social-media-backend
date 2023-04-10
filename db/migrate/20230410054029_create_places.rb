class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :title
      t.text :description
      t.text :image_link

      t.timestamps
    end
  end
end
