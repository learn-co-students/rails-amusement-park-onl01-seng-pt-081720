class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if meets_all_requirements
      "Enjoy the #{self.attraction.name}"
      #is tall enough but not enough tickets
    elsif self.user.tickets < self.attraction.tickets && self.user.height >= self.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
      #enough tickets but not tall enough
    elsif self.user.tickets >= self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      #doesn't meet any requirements
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    end
  end

  def meets_all_requirements
    if self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
      self.user.update(
        happiness: (self.user.happiness + self.attraction.happiness_rating),
        nausea: (self.user.nausea + self.attraction.nausea_rating),
        tickets: (self.user.tickets - self.attraction.tickets),
      )
    end
  end
end
