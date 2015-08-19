require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'eighties_cartoons'
)

get '/api/cartoons' do
  FunnyCartoon.all.to_json
end

get '/api/cartoons/:id' do
  FunnyCartoon.find(params[:id]).to_json
end

post '/api/cartoons' do
  @funny_cartoon = FunnyCartoon.new
  @funny_cartoon.name = params[:name]
  @funny_cartoon.plot = params[:plot]
  @funny_cartoon.watch_again = params[:watch]
  @funny_cartoon.save
  @funny_cartoon.to_json
end

put '/api/cartoons/:id' do
  cartoon_args = {:name => params[:name], :plot => params[:plot], :watch_again => params[:watch]}
  @funny_cartoon = FunnyCartoon.find(params[:id])
  @funny_cartoon.update(cartoon_args)
  @funny_cartoon.to_json
end

patch '/api/cartoons/:id' do
  cartoon_args = {:name => params[:name], :plot => params[:plot], :watch_again => params[:watch]}
  @funny_cartoon = FunnyCartoon.find(params[:id])
  @funny_cartoon.update(cartoon_args)
  @funny_cartoon.to_json
end

delete '/api/cartoons/:id' do
  @funny_cartoon = FunnyCartoon.find(params[:id])
  @funny_cartoon.destroy
  @funny_cartoon.to_json
end
