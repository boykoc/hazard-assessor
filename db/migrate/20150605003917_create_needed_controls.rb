class CreateNeededControls < ActiveRecord::Migration
  def change
    create_table :needed_controls do |t|
      t.references :hazard, index: true
      t.text :content
      t.boolean :completed

      t.timestamps null: false
    end
    add_foreign_key :needed_controls, :hazards
  end
end
