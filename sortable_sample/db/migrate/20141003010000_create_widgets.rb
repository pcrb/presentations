class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.references :thing, index: true
      t.string :name
      t.integer :display_order
      t.timestamps
    end
    add_index :widgets, :display_order
  end
end
