class RestaurantSerializer < ActiveModel::Serializer
  attributes :pizza_id, :restaurant_id, :price

  belongs_to :restaurant
  belongs_to :pizza
end
