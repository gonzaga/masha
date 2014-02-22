require 'sinatra'
require 'fast_gettext'

FastGettext.add_text_domain('app', path: 'locales', type: :po)
FastGettext.text_domain = 'app'
FastGettext.available_locales = ['ru','en']

include FastGettext

set :port, 80 if production?
set :haml, :format => :html5
set :root, File.dirname(__FILE__)

before '*' do
  path_params = request.path.sub(/^\//,'').split('/')
  if FastGettext.available_locales.include? path_params.first
    FastGettext.locale = path_params.first
    request.path_info = '/' + path_params.drop(1).join('/')
  else
    FastGettext.locale = 'en'
  end
end

before '/*' do
  
end

get '/' do
  haml :index
end
