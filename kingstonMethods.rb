# Homework Day 1
# Create by Jamie Kingston

# Find and use five methods for each of the following classes: string, boolean, integer and float

# String methods
string = nil
puts "What is your favorite color?"
string = gets.chomp.upcase
puts string
length = string.length
puts "The word #{string} is #{length} letters long"
puts "And spells #{string.reverse} backwards"

# integer methods
initial = string[0]
ordVal = initial.ord
puts "The ordinal value of #{initial} is #{ordVal}"
ordRound = ordVal.round(-1)
charRound = ordRound.chr
compare = nil
	
puts "Which rounds to #{ordRound}"

if ordRound > ordVal
	compare = "greater than"
elsif ordRound < ordVal
	compare = "less than"
else
	compare = "equal to"
end

puts "Which is #{compare} #{ordVal}"
puts "#{ordRound} corresponds to the character #{charRound}"
puts "The difference between the ordinal value of #{charRound} and the ordinal value of #{initial} is #{(ordRound - ordVal).abs} ..."

if (ordRound - ordVal).even?
	puts "... which is an even number"
else
	puts "... which is an odd number"
end

if (ordRound - ordVal) == 0
	puts "... which is kind of odd"
end

celcius = nil
farenheit = nil
user_input = nil

# program logic
puts "Enter temperature in degrees Farenheit: "
# change user input to a float
farenheit = gets.to_f
puts "#{farenheit}° F"
# do maths
celcius = ((farenheit - 32) / 1.8).round(1)
# print celcius to user
puts "The same temperature in degrees Celcius is #{celcius}° C"
tempRatioFC = farenheit / celcius
puts "The temperature in Farenheit divided by the temperature in Celcius equals #{tempRatioFC}"
puts "Which is a float with a value between #{tempRatioFC.floor} and #{tempRatioFC.ceil}"

conjuction = nil

if tempRatioFC.round(0) != tempRatioFC.truncate 
	conjuction = ", but"
else 
	conjuction = "and"
end

puts "#{tempRatioFC} rounds to #{tempRatioFC.round(0)} #{conjuction} truncates to #{tempRatioFC.truncate}"



