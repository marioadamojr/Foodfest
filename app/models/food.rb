class Food < ApplicationRecord
  belongs_to :truck

  validates :name, presence: true 
  validates :name, uniqueness: true

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
      truck.try(:name)
    end
  
    def truck_name=(name)
      self.truck = Truck.find_or_create_by(name: name) if name.present?
    end
end
