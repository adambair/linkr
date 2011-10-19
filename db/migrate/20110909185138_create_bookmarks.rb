class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.text :notes
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
  end
end
