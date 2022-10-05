class RestaurantsController < ApplicationController
    skip_before_action :verify_authenticity_token
    wrap_parameters format: []

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        restaurant = Restaurant.all
        render json: restaurant
    end

    def show 
        restaurant = find_restaurant
        if restaurant
            render json: restaurant
        else
            render_not_found_response
        end
    end
    
    def create
        restaurant = Restaurant.create(restaurant_params)
        if restaurant
            render json: restaurant, stattus: :created
        else
            render json: { error: "restaurant could not be created" }, status: :unprocessable_entity
        end
    end

    def destroy
        restaurant =find_restaurant
        if restaurant.destroy
            head :no_content
        else
            render_not_found_response
        end

    end

    private

    def restaurant_params
        params.permit(:name, :address)
    end

    def find_restaurant
        Restaurant.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Restaurant not found" }, status: :not_found
    end

end
