class FoodsController < ApplicationController
  before_action :get_truck
  
  def new
    # session[:truck_id] = params[:id]
    if params[:truck_id] && !Truck.exists?(params[:truck_id])
      redirect_to trucks_path, alert: "Truck not found."
    else
      @food = @truck.foods.build
      @truck = Truck.find_by(params[:truck_id])
    end
  end
  
  def create
    @food = @truck.foods.build(food_params)
    
    if @food.save
      redirect_to truck_path(params[:truck_id])
    else
      binding.pry
        redirect_to new_truck_food_path
    end
  end
    
    def purchase
        flash[:notice] = @food.buy_item
    end

    
    def index
      # if params[:truck_id]
      #   @truck = Truck.find_by(id: params[:truck_id])
      #   if @truck.nil?
      #     redirect_to trucks_path, alert: "Truck not found"
      #   else
      #     @foo/foodds = @truck.foods
      #   end
      # else
      #   @foods = Food.all
      # end
      @truck = Truck.find_by(id: params[:truck_id])

      redirect_to @truck

    end

    def show
      if params[:truck_id]
        # @truck = Truck.find_by(id: params[:truck_id])
        @food = @truck.foods.find_by(id: params[:id])
        if @food.nil?
          redirect_to truck_foods_path(@truck), alert: "Food not found"
        end
      else
        @food = Food.find(params[:id])
      end
    end

    private

    def food_params
      params.require(:food).permit(:name, :description, :price, :beverage, :truck_id)
    end

    def get_truck
      @truck = Truck.find_by(id: params[:truck_id])
    end

  end
  