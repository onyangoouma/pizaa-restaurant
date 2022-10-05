class PizzasController < ApplicationController
    
    def index 
        pizzas = Pizza.all
        render json: pizzas
    end

    def show
        pizza = find_pizza
        if pizzarender json: pizza
        else
            render_not_found_response
        end
    end

    private

    def find_pizza
        Pizza.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "pizza not found" }, status: :not_found
    end
end
