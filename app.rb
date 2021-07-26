require 'bundler'
Bundler.require

require_relative './lib/router.rb'

########################################
########################################
####### CLASSE
class App


 ########################################
 def initialize()
   Router.new.perform
 end

########################################
end


