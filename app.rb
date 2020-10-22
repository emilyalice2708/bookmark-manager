require 'sinatra/base' 
require 'shotgun'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

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

  delete '/bookmarks/:id' do
    Bookmark.delete(params['id'])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark_id = params[:id]
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    connection = PG.connect :dbname => 'bookmark_manager_test'
    connection.exec("UPDATE bookmarks SET url = '#{params[:link]}', title = '#{params[:title]}' WHERE id = '#{params[:id]}'")
    redirect to '/bookmarks'
  end
  
  run! if app_file == $0
end