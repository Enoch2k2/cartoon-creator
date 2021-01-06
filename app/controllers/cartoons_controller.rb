class CartoonsController < ApplicationController
  get '/cartoons' do
    @cartoons = Cartoon.all
    erb :'cartoons/index'
  end
end