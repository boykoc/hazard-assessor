class AddDetailsToAssessment < ActiveRecord::Migration
  def change
    add_column :assessments, :name, :string
    add_column :assessments, :description, :text
    add_column :assessments, :workplace, :string
  end
end
