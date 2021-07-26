require 'bundler'
Bundler.require

require_relative './gossip.rb'

########################################
########################################
####### CLASSE

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :gossip_new
  end

  get '/gossips/:id' do 
    erb :gossip_id, locals: {gossip: Gossip.find(params['id'].to_i)}
  end


  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end


#########################################
end
