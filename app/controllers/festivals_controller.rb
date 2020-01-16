class FestivalsController < ApplicationController

    def new
        @festival = Festival.new
    end

    def create
        @festival = Festival.new(festival_params)
        if @festival.save
            redirect_to @festival
        else
            redirect_to new_festival_path
        end
    end

    def show
        @festival = Festival.find(params[:id])
    end

    def index
        @festivals = Festival.all
    end

    def edit
        @festival = Festival.find_by(id: params[:id])
    end

    def update
        @festival = Festival.find_by(id: params[:id])
        if @festival.update(festival_params)
            redirect_to festival_path(@festival)
        else
            redirect_to edit_festival_path(@festival)
        end
    end

    def dates_search
    end

    def dates_display
        # binding.pry
        
        @search_dates = Festival.where('hours BETWEEN ? AND ?', params[:festival][:start_date].to_datetime, params[:festival][:end_date].to_datetime)
     end


    private

    def festival_params
        params.require(:festival).permit(:name, :location, :hours)
    end
end