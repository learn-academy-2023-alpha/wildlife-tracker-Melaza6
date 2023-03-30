class SightingsController < ApplicationController
    def index
        sights = Sighting.all 
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
        params.require(:sighting).permit(:latitude, :longitude, :date)
    end
end
