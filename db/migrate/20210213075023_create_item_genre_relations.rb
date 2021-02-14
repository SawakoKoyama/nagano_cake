class CreateItemGenreRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :item_genre_relations do |t|

      t.timestamps
    end
  end
end
