require 'bundler'
Bundler.require

require_relative './controller.rb'

########################################
########################################
####### CLASSE
class Gossip

  attr_accessor :author, :content

  ########################################
  def initialize(author, content)
    @author = author
    @content = content
  end

########################################
 ####### SAUVER GOSSIP SUR FICHIER CSV
 def save
  #file = File.open("./db/gossip.csv", "w")
  #file.close
  file = CSV.open("./db/gossip.csv", "a+") do |csv|
    csv << [@author, @content]
  end
end

########################################
 ####### ARRAY A PARTIR DU db/CSV
 def self.all
  all_gossips = []
  file = File.foreach("./db/gossip.csv") do |line|
    gossip_provisoire = Gossip.new(line.split(',')[0], line.split(',')[1])
    all_gossips << gossip_provisoire
  end
  return all_gossips
  file.close
end

########################################
 ####### DETRUIRE ET REECRIRE
 def self.destroy(id)
  all_gossips = Gossip.all
  all_gossips.delete_at(id)
  file = File.open("./db/gossip.csv", "w")
  all_gossips.each do |gossip|
    file.puts("#{gossip.author},#{gossip.content}")
  end
  file.close
 end


 ########################################
 ####### TROUVER UN GOSSIP
 def self.find(id)
  i = 1
  file = File.foreach("./db/gossip.csv") do |line|
    if i == id
      gossip_provisoire = Gossip.new(line.split(',')[0], line.split(',')[1])
      return gossip_provisoire
    end
    i +=1
  end
  file.close
  
 end

########################################
end


