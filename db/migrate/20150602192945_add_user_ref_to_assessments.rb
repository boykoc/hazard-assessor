class AddUserRefToAssessments < ActiveRecord::Migration
  def change
    add_reference :assessments, :user, index: true
    add_foreign_key :assessments, :users
  end
end
