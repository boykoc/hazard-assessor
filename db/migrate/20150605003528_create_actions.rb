class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :hazard, index: true
      t.text :content
      t.boolean :completed

      t.timestamps null: false
    end
    add_foreign_key :actions, :hazards
  end
end
