class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
    @recipe.save
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
end

patch '/recipes/:id' do
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.title = params[:title]
  @recipe.content = params[:content]
  @recipe.save
  redirect to "/articles/#{@recipe.id}"
end

get '/recipes' do
  @recipe = Recipe.all
  erb :index
end

delete '/recipes/:id/delete' do
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.delete
  redirect to '/recipes'
    end
  end
