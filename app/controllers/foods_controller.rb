class FoodsController < ApplicationController
    def create
      @food = Food.new(guest_id: current_user.id, truck_id: params[:truck_id])
      redirect_to truck_path(truck_id: params[:truck_id])
    end
    
    def purchase
        flash[:notice] = @food.buy_item
    end

    private

    def food_params
      params.require(:user).permit(:name, :description, :price, :beverage, :guest_id, :truck_id)
    end
  end
  