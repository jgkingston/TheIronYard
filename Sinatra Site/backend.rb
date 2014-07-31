require 'sinatra'
require 'faker'



get '/home' do

  @name = Faker::Commerce.product_name
  
  if @name[-1] == "s"

    @name = @name[0..@name.length-2]

  end

  @home_content_header = "Dwarf Fortress is Unlike Any Game You Have Ever Played"
  erb :contentHome, layout: :static_elements
end

class Dorf

    attr_accessor :name
    attr_accessor :profession
    attr_accessor :skills

    def initialize *dorf_attributes
      self.name = dorf_attributes[0]
      self.profession = dorf_attributes[1]
      self.skills =  dorf_attributes[2]
    end

  end

get '/embark' do
  
  @name = Faker::Commerce.product_name

  if @name[-1] == "s"

    @name = @name[0..@name.length-2]

  end

  @embark_profile = []
  
  @embark_profile.push Dorf.new "Urist McLeader", "Mason/Trader", {    "Mason" => 5,  "Building Designer" => 1, "Negotiator" => 1, "Judge Of Intent" => 1, "Organizer" => 1, "Appraiser" => 1}
  @embark_profile.push Dorf.new "Urist McMiner", "Miner", {"Miner" => 5}
  @embark_profile.push Dorf.new "Urist MacMiner", "Miner", {"Miner" => 5}
  @embark_profile.push Dorf.new "Urist McFixer", "Mechanic/Doctor", {"Mechanic" => 5, "Diagnostician" => 1, "Record Keeper" => 1}
  @embark_profile.push Dorf.new "Urist McBrewer", "Farmer/Brewer", {"Grower" => 5, "Brewer" => 4, "Armorer" => 1}
  @embark_profile.push Dorf.new "Urist McCook", "Farmer/Cook", {"Grower" => 5, "Cook" => 4, "Weaponsmith" => 1}
  @embark_profile.push Dorf.new "Urist McMaker", "Metalsmith/Jewler", {"Metalsmith" => 5, "Gem Setter" => 5}


  @embark_content_header = "The Magnificent (Misadventured) Seven"
  
  erb :content1, layout: :static_elements
end

get '/design' do

  @name = Faker::Commerce.product_name

  if @name[-1] == "s"

    @name = @name[0..@name.length-2]

  end

  # @appts = "Upper Apartment Level(s*):    Lobby Level:           Lower Apartment Level(s*):\n
  #      +-----+ +-----+          +-----+ +-----+              +-----+ +-----+      \n
  #      ¦..¦..¦ ¦..¦..¦          ¦..¦..¦ ¦..¦..¦              ¦..¦..¦ ¦..¦..¦      \n
  #      ¦.+-+.¦ ¦.+-+.¦          ¦.+-+.¦ ¦.+-+.¦              ¦.+-+.¦ ¦.+-+.¦      \n
  #      ¦-¦X¦-¦ ¦-¦X¦-¦          ¦-¦X¦-----¦X¦-¦              ¦-¦X¦-----¦X¦-¦      \n
  #      ¦.+¦+.¦ ¦.+-+.¦          ¦.+¦+.OOO.+-+.¦              ¦.+¦+..¦..+-+.¦      \n
  #      ¦..¦..¦ ¦..¦..¦          ¦..¦.......¦..¦              ¦..¦.+---+.¦..¦      \n
  #      +--+-------+--+          +--¦..###..¦--+              +--¦.¦~~~¦.¦--+      \n
  #         ¦XX#~#XX¦                ¦<<#~#<<¦                    ¦-¦~¦~¦-¦         \n
  #      +--+-------+--+          +--¦..###..¦--+              +--¦.¦~~~¦.¦--+      \n
  #      ¦..¦..¦ ¦..¦..¦          ¦..¦.......¦..¦              ¦..¦.+---+.¦..¦      \n
  #      ¦.+-+.¦ ¦.+-+.¦          ¦.+-+.OOO.+-+.¦              ¦.+-+..¦..+-+.¦      \n
  #      ¦-¦X¦-¦ ¦-¦X¦-¦          ¦-¦X¦-----¦X¦-¦              ¦-¦X¦-----¦X¦-¦      \n
  #      ¦.+-+.¦ ¦.+-+.¦          ¦.+-+.¦ ¦.+-+.¦              ¦.+-+.¦ ¦.+-+.¦      \n
  #      ¦..¦..¦ ¦..¦..¦          ¦..¦..¦ ¦..¦..¦              ¦..¦..¦ ¦..¦..¦      \n
  #      +-----+ +-----+          +-----+ +-----+              +-----+ +-----+      \n"

@appts=[]
  @appts.push "Upper Apartment Level(s*):    Lobby Level:           Lower Apartment Level(s*):"
  @appts.push "    +-----+ +-----+          +-----+ +-----+              +-----+ +-----+      "
  @appts.push "    ¦..¦..¦ ¦..¦..¦          ¦..¦..¦ ¦..¦..¦              ¦..¦..¦ ¦..¦..¦      "
  @appts.push "    ¦.+-+.¦ ¦.+-+.¦          ¦.+-+.¦ ¦.+-+.¦              ¦.+-+.¦ ¦.+-+.¦      "
  @appts.push "    ¦-¦X¦-¦ ¦-¦X¦-¦          ¦-¦X¦-----¦X¦-¦              ¦-¦X¦-----¦X¦-¦      "
  @appts.push "    ¦.+¦+.¦ ¦.+-+.¦          ¦.+¦+.OOO.+-+.¦              ¦.+¦+..¦..+-+.¦      "
  @appts.push "    ¦..¦..¦ ¦..¦..¦          ¦..¦.......¦..¦              ¦..¦.+---+.¦..¦      "
  @appts.push "    +--+-------+--+          +--¦..###..¦--+              +--¦.¦~~~¦.¦--+      "
  @appts.push "       ¦XX#~#XX¦                ¦<<#~#<<¦                    ¦-¦~¦~¦-¦         "
  @appts.push "    +--+-------+--+          +--¦..###..¦--+              +--¦.¦~~~¦.¦--+      "
  @appts.push "    ¦..¦..¦ ¦..¦..¦          ¦..¦.......¦..¦              ¦..¦.+---+.¦..¦      "
  @appts.push "    ¦.+-+.¦ ¦.+-+.¦          ¦.+-+.OOO.+-+.¦              ¦.+-+..¦..+-+.¦      "
  @appts.push "    ¦-¦X¦-¦ ¦-¦X¦-¦          ¦-¦X¦-----¦X¦-¦              ¦-¦X¦-----¦X¦-¦      "
  @appts.push "    ¦.+-+.¦ ¦.+-+.¦          ¦.+-+.¦ ¦.+-+.¦              ¦.+-+.¦ ¦.+-+.¦      "
  @appts.push "    ¦..¦..¦ ¦..¦..¦          ¦..¦..¦ ¦..¦..¦              ¦..¦..¦ ¦..¦..¦      "
  @appts.push "    +-----+ +-----+          +-----+ +-----+              +-----+ +-----+      "

  erb :content2, layout: :static_elements
end

 