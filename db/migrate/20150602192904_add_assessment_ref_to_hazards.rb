class AddAssessmentRefToHazards < ActiveRecord::Migration
  def change
    add_reference :hazards, :assessment, index: true
    add_foreign_key :hazards, :assessments
  end
end
