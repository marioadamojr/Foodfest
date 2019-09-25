class Food < ApplicationRecord
  belongs_to :truck
  belongs_to :festival

    # def buy_item
    #   if user.money < self.price
    #     "Sorry. You do not have enough money to purhcase #{self.name}"
    #   else
    #     user.money -= self.price
    #     truck.money += self.price
    #     user.save
    #     truck.save
    #     "Enjoy your #{self.name}!"
    #   end
    # end

    def truck_name
      self.try(:truck).try(:name)
    end
  
    def truck_name=(name)
      truck = Truck.find_or_create_by(name: name)
      self.truck = truck
    end
end
