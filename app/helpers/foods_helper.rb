module FoodsHelper
    def truck_id_field(food)
      if food.truck.nil?
        select_tag "food[truck_id]", options_from_collection_for_select(Truck.all, :id, :name)
      else
        hidden_field_tag "food[truck_id]", food.truck_id
      end
    end
  end
  