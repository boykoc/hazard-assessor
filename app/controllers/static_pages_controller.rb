class StaticPagesController < ApplicationController
  def home
    @assessments = Assessment.includes(:hazards).limit(2)
  end

  def about
  end

  def help
  end
end
