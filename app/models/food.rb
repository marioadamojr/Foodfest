class Food < ApplicationRecord
    belongs_to :guest
    belongs_to :truck

    def buy_item
        if user.money < self.price
          "Sorry. You do not have enough money to purhcase #{self.name}"
        else
          user.money -= self.price
          truck.money += self.price
          user.save
          truck.save
          "Enjoy your #{self.name}!"
        end
      end
end
