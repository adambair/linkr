class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :url
      t.string :title
      t.integer :bookmark_id

      t.timestamps
    end
  end
end
