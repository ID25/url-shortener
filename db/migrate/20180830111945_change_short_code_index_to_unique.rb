class ChangeShortCodeIndexToUnique < ActiveRecord::Migration[5.2]
  def change
    remove_index :links, :short_code
    add_index :links, :short_code, unique: true
  end
end
