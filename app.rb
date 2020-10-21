require 'sinatra/base' 
require 'shotgun'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.add(params[:link], params[:title])
    redirect to '/bookmarks'
  end
  
  run! if app_file == $0
end