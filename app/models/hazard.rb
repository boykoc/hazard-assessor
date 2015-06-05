class Hazard < ActiveRecord::Base
  belongs_to :assessment
  has_many :neededControls
  before_save :assess_hazard

  protected
    def assess_hazard
      set_probability
      set_rating
    end

  def set_probability
    if self.exposure.to_i.between?(1,2) && self.occurance.to_i == 1 || self.exposure.to_i == 1 && self.occurance.to_i.between?(1,2)
        self.probability = "A"
      elsif self.exposure.to_i.between?(1,2) && self.occurance.to_i == 3 ||
            self.exposure.to_i.between?(2,3) && self.occurance.to_i == 2 ||
            self.exposure.to_i.between?(3,4) && self.occurance.to_i == 1
        self.probability = "B"
      elsif self.exposure.to_i == 1 && self.occurance.to_i == 5 ||
            self.exposure.to_i.between?(1,2) && self.occurance.to_i == 4 ||
            self.exposure.to_i.between?(3,4) && self.occurance.to_i == 3 ||
            self.exposure.to_i.between?(4,5) && self.occurance.to_i == 2 ||
            self.exposure.to_i.between?(5,6) && self.occurance.to_i == 1
        self.probability = "C"
      elsif self.exposure.to_i.between?(1,3) && self.occurance.to_i == 6 ||
            self.exposure.to_i.between?(2,4) && self.occurance.to_i == 5 ||
            self.exposure.to_i.between?(3,5) && self.occurance.to_i == 4 ||
            self.exposure.to_i.between?(5,6) && self.occurance.to_i == 3 ||
            self.exposure.to_i == 6 && self.occurance.to_i == 2
        self.probability = "D"
      elsif self.exposure.to_i.between?(4,6) && self.occurance.to_i == 6 ||
            self.exposure.to_i.between?(5,6) && self.occurance.to_i == 5 ||
            self.exposure.to_i == 6 && self.occurance.to_i == 4
        self.probability = "E"
      end
    end

  def set_rating
      if self.consequence.to_i.between?(1,3) && self.probability == "A" ||
         self.consequence.to_i.between?(1,2) && self.probability == "B" ||
         self.consequence.to_i == 1 && self.probability == "C"
        self.rating = "High"
      elsif self.consequence.to_i == 1 && self.probability == "E" ||
            self.consequence.to_i.between?(1,2) && self.probability == "D" ||
            self.consequence.to_i.between?(2,3) && self.probability == "C" ||
            self.consequence.to_i.between?(3,4) && self.probability == "B" ||
            self.consequence.to_i.between?(4,5) && self.probability == "A"
        self.rating = "Medium"
      elsif self.consequence.to_i.between?(2,5) && self.probability == "E" ||
            self.consequence.to_i.between?(3,5) && self.probability == "D" ||
            self.consequence.to_i.between?(4,5) && self.probability == "C" ||
            self.consequence.to_i == 5 && self.probability == "B"
        self.rating = "Low"
      end
    end
end
