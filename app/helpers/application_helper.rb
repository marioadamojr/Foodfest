module ApplicationHelper
    def truck_select(truck, food)
        if truck
          truck.name
        else
          select_tag "food[truck_id]", options_from_collection_for_select(Truck.all, :id, :name)
        end
      end
      def display_truck(food)
        food.truck.nil? ? link_to("Add Truck", edit_food_path(food)) : link_to(food.truck_name, truck_path(food.truck))
      end
    
end
