require 'sinatra'

set :port, 80 if production?
set :haml, :format => :html5
set :root, File.dirname(__FILE__)

get '/' do
  haml :index
end
