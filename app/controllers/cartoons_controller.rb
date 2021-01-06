class CartoonsController < ApplicationController
  get '/cartoons' do
    redirect_if_not_logged_in
    @cartoons = Cartoon.all
    erb :'cartoons/index'
  end
end