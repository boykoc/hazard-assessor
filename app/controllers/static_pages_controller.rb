class StaticPagesController < ApplicationController
  def home
    @assessments = Assessment.includes(:hazards).order(updated_at: :asc).limit(2)
  end

  def about
  end

  def help
  end
end
