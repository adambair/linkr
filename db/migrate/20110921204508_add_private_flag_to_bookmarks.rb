class AddPrivateFlagToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :private, :boolean, :default => false
  end
end
