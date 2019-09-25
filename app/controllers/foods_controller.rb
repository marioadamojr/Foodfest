class FoodsController < ApplicationController
  
  def new
    session[:truck_id] = params[:id]
    if params[:id] && !Truck.exists?(id: params[:id])
      # @truck = Truck.find_by(id: params[:id])
      @food = Food.new(truck_id: params[:id])
        else
      redirect_to trucks_path, alert: "Truck not found."
    end
  end
  
  def create
    @food = Food.new(food_params)
    if @food.save
        redirect_to truck_foods_path
    else
        redirect_to new_truck_food_path
    end
end
    
    def purchase
        flash[:notice] = @food.buy_item
    end

    private

    def food_params
      params.require(:food).permit(:name, :description, :price, :beverage, :festival_id, :truck_id)
    end

    def index
      if params[:truck_id]
        @truck = Truck.find_by(id: params[:truck_id])
        if @truck.nil?
          redirect_to trucks_path, alert: "Truck not found"
        else
          @foods = @truck.foods
        end
      else
        @foods = Food.all
      end
    end

  end
  