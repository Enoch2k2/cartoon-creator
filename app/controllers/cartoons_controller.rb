class CartoonsController < ApplicationController
  get '/cartoons' do
    redirect_if_not_logged_in
    @cartoons = Cartoon.all
    erb :'cartoons/index'
  end

  get '/cartoons/new' do
    erb :'cartoons/new'
  end

  post '/cartoons' do
    cartoon = current_user.cartoons.build(params[:cartoon])

    if cartoon.save
      redirect '/cartoons'
    else
      redirect '/cartoons/new'
    end
  end

  get '/cartoons/:id' do
    find_cartoon
    erb :'cartoons/show'
  end

  private

    def find_cartoon
      @cartoon = Cartoon.find_by_id(params[:id])
    end
end