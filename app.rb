require 'sinatra/base'
require 'sinatra/flash'
require 'shotgun'
require './lib/bookmark'
require_relative './database_connection_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    flash[:notice] = "Please enter a valid URL" unless Bookmark.add(params[:link], params[:title])
    redirect to '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params['id'])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(params[:id], params[:link], params[:title])
    redirect to '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark = Bookmark.find(params[:id])
    erb :'bookmarks/comments/new'
  end

  post '/bookmarks/:id/comments/' do
    connection = PG.connect :dbname => 'bookmark_manager_test'
    connection.exec("INSERT INTO comments (text, bookmark_id) VALUES ('#{params[:comment]}', '#{params[:id]}');")
    redirect to '/bookmarks'
  end
  
  run! if app_file == $0
end