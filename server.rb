require 'sinatra'
require 'sinatra/reloader'
require 'json'

require_relative 'helpers'

register Sinatra::Reloader

include Helper

set :bind, '0.0.0.0'

get '/users' do
  all_users.to_json
end
