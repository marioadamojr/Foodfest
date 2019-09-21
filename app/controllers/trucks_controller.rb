class TrucksController < ApplicationController

    def new
        @truck = Truck.new
    end

    def create
        @truck = Truck.new(truck_params)
        if @truck.save
            redirect_to @truck
        else
            redirect_to new_truck_path
        end
    end

    def show
        @truck = Truck.find(params[:id])
        @festival = Festival.find(@truck.festival_id)
        @food = Food.new
    end

    def index
        @trucks = Truck.all
    end

    def edit
        @truck = Truck.find_by(id: params[:id])
    end

    def update
        @truck = Truck.find_by(id: params[:id])
        if @truck.update(truck_params)
            redirect_to truck_path(@truck)
        else
            redirect_to edit_truck_path(@truck)
        end
    end

    private

    def truck_params
        params.require(:truck).permit(:name, :money, :festival_id)
    end
end

