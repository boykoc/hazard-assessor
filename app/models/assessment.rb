class Assessment < ActiveRecord::Base
  belongs_to :user
  has_many :hazards
end