require 'sinatra/base' 
require 'shotgun'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:index)
  end

  run! if app_file == $0
end