require 'sinatra/base' 
require 'shotgun'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Hello, world!"
  end

end