require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require './models'

before do
    @my_name = '<あなたのアダ名に変更する>'
    @categories = Category.all
end

get '/' do
    erb :index
end