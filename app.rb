require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require_relative 'config/application'

get '/' do
  @hello = 'Hi there!'
  erb :index
end

# Ruby embedded into views files
# pe + tab   ->    <%=  %>     (display something)
# er + tab   ->    <%   %>     (display nothing)





# DO NOT CHANGE BELOW LINES
# Some configuration for Sinatra to be hosted and operational on Heroku
after do
  # Close the connection after the request is done so that we don't
  # deplete the ActiveRecord connection pool.
  ActiveRecord::Base.connection.close
end