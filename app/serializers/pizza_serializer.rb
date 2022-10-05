class PizzaSerializer < ActiveModel::Serializer
  attributes :name, :ingredients
  has_many :restaurants
  #has_many :restaurants, serializer: RestaurantPizzaSerializer
end

