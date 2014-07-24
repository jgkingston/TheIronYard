# Horse Races

=begin

At least 3 computer "racers"
Player can pick their horse's name
e.g. 
------ horse1
---- horse 2
--------- horse 3
------- player's horse

each time the user hits enter the horses move a random distance. The user can use codes to affect their horses speed, e.g. faster, slower, speed of light, remove the competition.

=end


class Horse
# Defines the horse class that will be used by the player and the computer
  @@list_of_horses = []
  attr_accessor :name
  attr_accessor :speed
  attr_accessor :distance
  attr_accessor :position

  def initialize
    # puts "A horse has entered the race."
    self.name = ""
    self.speed = 0
    self.distance = 0
    self.position = 0

  end

  def self.add_horse *horse_attributes
  # Creates a new horse object and return that object
    horse = Horse.new
    horse.name = horse_attributes[0]
    horse.speed = rand 3..5
    horse.distance = 0
    horse.position = 0
    @@list_of_horses.push horse
    horse
  end

  def self.display_horses
  # Returns the array of horse objects
    @@list_of_horses
  end

  def run
  # Uses the horse objects speed (with a dash modifier) to increment the horse's distance attribute
    dash = (rand 1..3) - 2
    self.distance += speed + dash
    puts "-"*distance + " " + self.name
  end

end

class Race
# Define the Race class that stores the results of each race in a race object
  @@list_of_races = []
  attr_accessor :winner
  attr_accessor :time
  attr_accessor :cheat_count

  def self.add_race *race_attributes
  # Creates a new race object with some stats from the race that was just run
    race = Race.new
    race.winner = race_attributes[0]
    race.time = race_attributes[1]
    race.cheat_count = race_attributes[2]
    @@list_of_races.push race
    race
  end

  def self.display_races
  # Outputs each race object in the array to its own line
    @@list_of_races.each do |race|
      p race
    end
  end

end

def cheating racers, cheat
# The cheating function takes cheat codes input by the user and then modifies horse objects based on the code string
  # puts cheat
  case cheat
  when "speed"
    racers[3].speed = 10
    puts "You slip your horse some 'ancient chinese medicine."
  when "ftl"
    racers[3].speed = 51
    puts "Your horse has a jet pack."
  when "head start"
    racers[3].distance += 5
    puts "You somehow manage to jump ahead of the competition."
  when "sabotage"
    victim = rand 0..2
    racers[victim].speed = 1
    puts "You tie #{racers[victim].name}'s legs together"
  when "poison"
    victims = racers[0..2]
    victims.sort { |a,b| b.speed <=> a.speed}
    victim = victims[0]
    racers.delete_at(racers.index victim)
    puts "#{victim.name} has died ... murderer."
  end
  # puts racers[3].name
end

# initializing variable to set the go condition
# user can change this to false at the end of each race
race_on = true

while race_on
# Main body of program. It generates horses and gets user input.

  horse_names = ["C Biscuit", "Carolina Chrome", "iHorse", "Ruby", "Urist McHorse", "Dog Biscuit", "Shadowfax"]

  # Create an array of horse object that will determine in which track each horse runs
  racers = []

  horse_names.shuffle!

  print "\n"
  puts "Announcer: 'It's a beautiful day here is Charleston, SC. Welcome to The Iron Yard Derby.'"
  print "\n"


  for num in 0..2
    racers[num] = Horse.add_horse horse_names[num]
    puts "#{racers[num].name} has entered the race."
  end

  print "\n"

  # p racers
  # p Horse.display_horses

  puts "What is the name of your horse? "
  print "\n"

  name = gets.chomp
  #name = "Test"
  racers.push Horse.add_horse name
  puts "#{name} has entered the race."
  print "\n"

  # p racers
  # p Horse.display_horses

  # Create another array to keep track of the relative positino of each horse. Also determines winner at end.
  positions = []

  racers.each do |racer|
    positions[racers.index racer] = racer
  end

  # Initializes the leader variable used in the while loop
  leader = positions[0]

  cheat_codes = ["speed", "ftl", "head start", "sabotage", "poison"]

  puts "You have prepared carefully for this race and have certain abilities at your disposal: "
  cheat_codes.each do |code|
    print "- "
    puts code
  end

  print "\n"

  track = " "*49 + "|"

  # Puts starting display on the console
  puts "Announcer: 'And here we are at the starting line."
  puts track
  racers.each do |racer|
    puts racer.name
  end
  puts track

  # Initialize some more race stats that will increment with each loop
  counter = 0

  num_cheats = 0

  # Main loop that makes the horses run and lets the player enter cheat codes
  while leader.distance < 50

    # Player gets to use cheats codes
    puts "Alright you cheating bastard. What's it going to be? (Just press Enter for a clean race)"

    cheat = gets.chomp

    if cheat.length > 0

      cheating racers, cheat

      # Increment num_cheat stat for race object
      num_cheats += 1
      
    end

    # Racers run
    racers.each do |racer|
      racer.run
    end

    # Display finish line "posts"
    puts " "*49 + "|"

    # Determines the position of each horse on the track
    positions.sort! { |a,b| b.distance <=> a.distance }

    # Assign leader based on position
    leader = positions[0]

    # Increment time stat for race object
    counter += 1

    # p leader

    # positions.each do |racer|
    #   racer.position = positions.index(racer) + 1
    # end
    
  end

    # Display name of winner
    puts leader.name + " wins!"
    # p racers

    # Create race object with stats from the race
    Race.add_race leader.name, counter, num_cheats

    # Check to see if user would like to see their stats
    puts "Would you like to see the results of your race(s)? (y/n)"

    display = gets.chomp

    if display == "y"
      Race.display_races
    end

    # Check to see if the user wants to play again
    puts "Would you like to run another race? (y/n)"

    again = gets.chomp

    if again != "y"

      race_on = false

    end

end






