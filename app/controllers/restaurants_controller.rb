class RestaurantsController < ApplicationController

before_action :pillar_restaurante, only: [:show]

def index
  @restaurants = Restaurant.all
end

def show #see pillar_restaurante
end


def new
  @restaurant = Restaurant.new
end

def create

  @restaurant = Restaurant.new(strong_restaurant_params)

  @restaurant.save
  redirect_to restaurant_path(@restaurant)
end

private

def strong_restaurant_params
  params.require(:restaurant).permit(:name, :address, :phone_number, :category)

end

def pillar_restaurante
  @restaurant = Restaurant.find(params[:id])
end

end
