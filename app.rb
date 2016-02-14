require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require './models.rb'

before do
    @my_name = 'poo'
    @categories = Category.all
end

get '/' do
    @memos = Memo.all
    erb :index
end

post '/create' do
    Memo.create({
        title: params[:title],
        comment: params[:comment]
    })
    
    redirect '/'
end
