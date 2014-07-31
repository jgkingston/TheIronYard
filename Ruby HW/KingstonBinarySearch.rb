# Binary Search
# 7.23.14

# Created by Jamie Kingston

# Create a number guessing game. Guess a number between 1 and 100 in five 
# tries.


# Generate a random number between 1 and 100



# puts number

# Ask the user to guess a number



def get_value
# This function asks the user for a number until a valid number is entered. It return that number.
	valid = false

	while valid == false

		puts "Pick a number between 1 and 100 (inclusive)."

		value = gets.chomp.to_i

		valid = check_value(value)	

	end

	return value

end

def check_value value
# This function checks to see if a value is within the designated range of values
	if value > 0 && value <= 100
		return true
	else
		puts "Not in range. Try again."
		return false
	end	
	
end

	

def evaluate_guess guess, number
# This function compares the user's guess against the secret number and tells the user whether their guess was high or low
	found = false
	
	if guess == number
		puts "#{guess} is correct."
		found = true		
	elsif guess < number
		puts "Guess a higher number."	
	else
		puts "Guess of lower number."			
	end

	return found

end



def ai_guess number, limit
# This controls the computers guessing method. It performs a binary search.
	found = false

	lower = 1
	upper = 100

	attempts = 0

	while found == false and attempts < limit

		guess = (upper + lower) / 2

		puts "The computer guesses #{guess} between #{lower} and #{upper}."

		puts "The computer guesses #{guess}."

			if guess == number

				found = true

			elsif guess > number

				upper = guess

				puts "#{guess} is higher than #{number}"

			else 

				lower = guess

				puts "#{guess} is lower than #{number}"

			end

		attempts += 1

	end

	return found

end


def player_game
# The program runs a game where the computer picks a random number and the user tries to guess it.
	puts "The computer is thinking of a number between 1 and 100. Try to guess it in seven tries."

	number = rand(1..100)

	found = false

	attempts = 0

	while found == false and attempts < 7
		guess = get_value
		found = evaluate_guess(guess, number)
		attempts += 1
	end

	if found
		puts "You win."
	else
		puts "You lose."
	end

end

def computer_game
# This program runs a game where the user picks a number and the computer tries to guess it using a binary search
	limit = 5

	puts "The computer will attempt to guess a number you select in #{limit} guesses."
	
	number = get_value

	found = ai_guess(number, limit)

	if found
		puts "The computer wins."
	else
		puts "The computer failed to guess your number in #{limit} attempts."
	end

end	


player_game

computer_game



