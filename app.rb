require "google/cloud/translate/v2"
require "google/cloud/vision"
require "open-uri"
if ['development', 'test'].include? ENV['APP_ENV']
  require 'dotenv/load'
end


require 'sinatra'
require 'sinatra/reloader'
# require 'sinatra/activerecord'
# require_relative 'config/application'


get '/' do
  @hello = 'Hi there!'
  erb :index
end

get '/vision' do
  vision = Google::Cloud::Vision.image_annotator
  @image = vision.text_detection(image: URI.open('http://localhost:4567/referral.jpg')).responses[0].text_annotations[0].description
  erb :vision
end

get '/translate' do
  translate = Google::Cloud::Translate::V2.new
  sentence = params["q"] || "Hello world!"
  lang = params["lang"] || "la"
  translation = translate.translate sentence, to: lang
  @translated = translation.text #=> "Salve mundi!"
  erb :translate
end

# Ruby embedded into views files
# pe + tab   ->    <%=  %>     (display something)
# er + tab   ->    <%   %>     (display nothing)





# DO NOT CHANGE BELOW LINES
# Some configuration for Sinatra to be hosted and operational on Heroku
# after do
#   # Close the connection after the request is done so that we don't
#   # deplete the ActiveRecord connection pool.
#   ActiveRecord::Base.connection.close
# end