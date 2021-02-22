class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_xp
    (total_xp / all.count).round(2)
  end

  def self.total_xp
    all.sum do |mech|
      mech.years_experience
    end.to_f
  end
end
