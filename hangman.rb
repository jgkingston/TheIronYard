puts "Ask a friend to enter a word while you are not looking:"
word = gets.chomp.upcase
# puts word
wordLength = word.length
puts "The word you need to guess is #{wordLength} letters long"
wordLetters = word.split(//)

blank = "_" * wordLength
blankArray = blank.split(//)


guessedLetters = []
wrongLetters = []


counter = 0
victory = false

while victory == false and counter < 7

	# print wordLetters
	# print "\n"

	print blankArray
	print "\n"

	guess = 0

	while guess.ord < 65 or guess.ord > 90
		puts "You have #{7 - counter} guess(es) remaing."
		puts "So far you have guessed the letters: "
		print guessedLetters 
		print "\n"
		puts "Guess a letter: "

		guess = gets.chomp.upcase

		if guess.ord < 65 or guess.ord > 90

			puts "That is not a letter!"

		else

			puts "That was a letter!"

			if guessedLetters.include?(guess)

				puts "You have already guessed that letter!"

			else

				puts "That is a new one!"

				guessedLetters.push(guess)

				if word.include?(guess)

					puts "Got one!"

					occurences = wordLetters.count(guess)

					puts "Found it!"

					for char in 1..occurences

						position = wordLetters.index(guess)

						wordLetters.delete_at(position)

						wordLetters.insert(position, "_")

						blankArray.delete_at(position)

						blankArray.insert(position, guess)

						puts "working ..."

					end
				else

					puts "Nope."

					wrongLetters.push(guess)

					counter += 1

				end

			end

			if blankArray.include?("_")

				victory = false

				puts victory

			else
			
				victory = true

				puts victory

			end	

		end

	end

end

if victory == true

	puts "Congratulations! You win."

else

	puts "Sorry. You lose."

end

