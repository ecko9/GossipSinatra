require 'bundler'
Bundler.require

require_relative './gossip.rb'

########################################
########################################
####### CLASSE

class ApplicationController < Sinatra::Base

##########################
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

##########################
  get '/gossips/new/' do
    erb :gossip_new
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

###########################
  get '/gossips/:id' do 
    erb :gossip_id, locals: {gossip: Gossip.find(params['id'].to_i)}
  end

###########################
  get '/gossips/:id/edit/' do
    erb :edit, locals: {id_old: params['id'].to_i}
  end

  post '/gossips/:id/edit/' do 
    Gossip.destroy((params['gossip_id'].to_i) - 1)
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
###########################
  


#########################################
end
