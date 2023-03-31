class SightingsController < ApplicationController
    def index
        sights = Sighting.where(date: params[:start_date]..params[:end_date])
        render json: sights
    end

    def show
        sight = Sighting.find(params[:id])
        render json: sight
    end

    def create
        sight = Sighting.create(sight_params)
        if sight.valid?
            render json: sight 
        else
            render json: sight.errors
        end
    end

    def update
        sight = Sighting.find(params[:id])
        sight.update(sight_params)
        if sight.valid?
            render json: sight 
        else
            render json: sight.errors
        end
    end

    def destroy
        sight = Sighting.find(params[:id])
        if sight.destroy
            render json: sight
        else
            render json: sight.errors
        end
    end

private
    def sight_params
        params.require(:sighting).permit(:animal_id, :latitude, :longitude, :date)
    end
    def sight_params_range
        params.require(:sighting).permit(animal_id, :latitude, :longitude, :date, start_date, end_date)
    end
end
