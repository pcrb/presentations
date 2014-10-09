class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name
      t.integer :display_order
      t.timestamps
    end
    add_index :things, :display_order
  end
end
