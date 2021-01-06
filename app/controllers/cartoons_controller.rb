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
    redirect_if_not_exist
    erb :'cartoons/show'
  end
  
  get '/cartoons/:id/edit' do
    find_cartoon
    redirect_if_not_exist
    redirect_if_not_owner
    erb :'cartoons/edit'
  end

  patch '/cartoons/:id' do
    find_cartoon
    if @cartoon.update(params[:cartoon])
      redirect "/cartoons/#{@cartoon.id}"
    else
      redirect "/cartoons/new"
    end
  end
  
  delete '/cartoons/:id' do
    find_cartoon
    redirect_if_not_exist
    @cartoon.destroy
    redirect "/cartoons"
  end

  private

    def find_cartoon
      @cartoon = Cartoon.find_by_id(params[:id])
    end

    def redirect_if_not_owner
      redirect "/cartoons" unless @cartoon.user == current_user
    end

    def redirect_if_not_exist
      redirect "/cartoons" unless @cartoon
    end
end