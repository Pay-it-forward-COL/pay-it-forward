class CreateFavors < ActiveRecord::Migration[6.1]
  def change
    create_table :favors do |t|
      t.references :user
      t.string :title
      t.text :description
      t.float :latitude
      t.float :longitude
      t.integer :category
      t.integer :status

      t.timestamps
    end
  end
end
