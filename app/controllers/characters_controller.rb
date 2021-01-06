class CharactersController < ApplicationController
  get '/cartoons/:cartoon_id/characters/new' do
    find_cartoon
    erb :'characters/new'
  end

  post "/cartoons/:cartoon_id/characters" do

    find_cartoon

    character = @cartoon.characters.build(params[:character])
    if character.save
      redirect "/cartoons/#{@cartoon.id}"
    else
      redirect "/cartoons/#{@cartoon.id}/characters/new"
    end
  end

  get '/cartoons/:cartoon_id/characters/:id' do
    find_cartoon
    find_character
    erb :'characters/show'
  end

  get '/cartoons/:cartoon_id/characters/:id/edit' do
    find_cartoon
    find_character
    erb :'characters/edit'
  end

  patch '/cartoons/:cartoon_id/characters/:id' do
    find_cartoon
    find_character
    if @character.update(params[:character])
      redirect "/cartoons/#{@cartoon.id}/characters/#{@character.id}"
    else
      redirect "/cartoons/#{@cartoon.id}/characters/#{@character.id}/edit"
    end
  end

  delete '/cartoons/:cartoon_id/characters/:id' do
    find_cartoon
    find_character
    @character.destroy
    redirect "/cartoons/#{@cartoon.id}"
  end

  private
    def find_cartoon
      @cartoon = Cartoon.find_by_id(params[:cartoon_id])
    end

    def find_character
      @character = Character.find_by_id(params[:id])
    end
end