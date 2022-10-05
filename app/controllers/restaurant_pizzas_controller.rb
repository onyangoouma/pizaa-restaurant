class RestaurantPizzasController < ApplicationController
    def index
        restaurantpizza = RestaurantPizza.all
        render json: restaurantpizza
    end

    def create
        restaurantpizza = RestaurantPizza.create(restaurant_params)
        if restaurantpizza
            render json: restaurantpizza, status: :created
        else
            render json: {error: "validation errors"}, status: :not_found
        end
    end

    private

    def restaurantpizza_params
        params.permit(:pizza_id, :restaurant_id, :price)
    end
end
