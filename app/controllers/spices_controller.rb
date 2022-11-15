class SpicesController < ApplicationController
    wrap_parameters format: []

    def index
        spices = Spice.all
        render json: spices
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spices
        spice.update(spice_params)
        if spice
            render json: spice, status: :accepted
        else
            render json: {error: "Spice not found"}, staus: :not_found
        end
    end

    def destroy
        spice = find_spices
        spice.destroy
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spices
        Spice.find_by(id: params[:id])
    end
end
