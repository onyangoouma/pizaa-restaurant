class RestaurantPizzaSerializer < ActiveModel::Serializer
  attributes :pizza_id, :restaurant_id, :price

  belongs_to :restaurant_id
  belongs_to :pizza
end
