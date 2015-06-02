class CreateHazards < ActiveRecord::Migration
  def change
    create_table :hazards do |t|
      t.text :name
      t.text :description
      t.string :exposure
      t.string :occurance
      t.string :probability
      t.string :consequence
      t.string :rating
      t.text :control

      t.timestamps null: false
    end
  end
end
