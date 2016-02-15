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
    @categories = Category.all
    erb :index
end

post '/create' do
    Memo.create({
        title: params[:title],
        comment: params[:comment],
        category_id: params[:category]
    })
    
    redirect '/'
end

post '/delete/:id' do
    Memo.find(params[:id]).destroy
    redirect '/'
end

post '/edit/:id' do
    @memo = Memo.find(params[:id])
    erb :edit
end

post '/renew/:id' do
    @memo = Memo.find(params[:id])
    @memo.update({
        title: params[:title],
        comment: params[:comment]
    })
    redirect '/'
end