class AddIsActiveToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :is_active, :status ,:boolean, default: true, null: false
  end
end
