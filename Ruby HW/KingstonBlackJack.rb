#Black Jack
#7.23.14

#Created by Jamie Kingstons

# Create Blackjack. Use numbers 1-11 for cards instead of creating an entire deck! I want to be able to split on double cards and play both hands.

# Bonus: create a dealer for the blackjack game. He doesn't have to split.

def build_deck
# This function builds an array of 52 cards made up of 4 copies of fixed nums with values from 1 to 13
	@deck = []
	for num in 1..4
		for num in 1..13
			@deck.push(num)
		end
	end
end

def deal player, dealer
# This function takes 4 cards from the deck and gives 2 to the player and 2 to the dealers
	for num in 1..2

		player.push(@deck.pop)

		dealer.push(@deck.pop)

	end	

	facecards(@deck)
	facecards(dealer)

end

def facecards cards
# Coverts all face cards (11 .. 13) to 10
	cards.map! do |card|
		if card > 10
			10
		else
			card
		end
	end	
end		

def hit hand
# Takes an element out of the deck array and puts in in the player's hand
	hand.push(@deck.pop)
end

# def show_hands player, dealer, split
# # Displays the contents of all the hands
# 	p player
# 	p dealer
# 	if split.length > 0
# 		p split
# 	end
# end

def smart_aces hand
# Adjusts the value of "Ace" elements to be either 1 or 11 depending on the hand total
	hand_total = hand.reduce :+
	if hand_total < 12 && hand_total > 2
		hand.map! do |card|
			if card == 1
				11
			else
				card
			end
		end
	elsif hand_total > 21
		hand.map! do |card|
			if card == 11
				1
			else
				card
			end
		end
	elsif hand_total == 2
		hand[0] = 11
	end

end

def split_decision player, split
# When the player is dealth a pair this function lets them split their hand.
# If the player chooses to split it deals 2 new cards out of the deck and adjust face cards to value 10
	print "Your hand: "
	p player
	puts "Do you want to split? (y/n)"
	split_deicision = gets.chomp.downcase
	if split_deicision == "y"
		split.push(player.pop)
		facecards(split)
		hit(split)
		hit(player)
		smart_aces(split)
		print "Your split hand: "
		p split
	end
end

def play_hand hand, total
# Controls the flow of play
# Shows the player their hand and calculates their current total
# It will aks the player if they want to hit until they bust or choose to stand

	if total == 21

		puts "Black Jack (Player)"
		print "\n"

	else

		stand = false

		while hand.length > 0 && total < 22 && stand == false
			print "Hand: ", hand, ", Total: ", total, "\n"
			puts "Do you want to hit? (y/n)"
			hit = gets.chomp.downcase
			if hit == "y"
				hit(hand)
				smart_aces(hand)
				total = hand.reduce :+
			else
				stand = true
				puts "Player stands at #{total}."
				print "\n"

			end
		end	

		if total > 21

			print "Hand: ", hand, ", Total: ", total, "\n"
			puts "Player busts."
			print "\n"

		end

	end	

end


def play_black_jack
# Runs the game and takes the dealers turn
# It compares hands at the end to determine a winner

	build_deck

	@deck.shuffle!

	player = []

	split = []

	dealer = []

	deal(player, dealer)

	# player = [1,1]

	if player[0] == player[1]
		split_decision(player, split)
	else
		split.push(0)
	end

	facecards(player)

	smart_aces(player)
	print "Your hand: "
	p player

	smart_aces(dealer)
	print "Dealer's hand: "
	p dealer
	print "\n"

	player_total = player.reduce :+
	split_total = split.reduce :+
	dealer_total = dealer.reduce :+

	if split_total > 1
		play_hand(split, split_total)
	end

	play_hand(player, player_total)

	player_total = player.reduce :+
	split_total = split.reduce :+

	if player_total < 22 || (split_total < 22 && split_total > 0)

		if dealer_total == 21

			puts "Black Jack (Dealer)"

		else

			stand = false

			while dealer_total < 17 && stand == false
				print "Dealer's hand: ", dealer, ", Total: ", dealer_total, "\n"
				puts "Dealer hits himself."
				hit(dealer)
				smart_aces(dealer)
				dealer_total = dealer.reduce :+
			end
				
			if dealer_total > 21

				print "Dealer's hand: ", dealer, ", Total: ", dealer_total, "\n"
				puts "Dealer busts."

			else
				print "Dealer's hand: ", dealer, ", Total: ", dealer_total, "\n"
				puts "Dealer stands at #{dealer_total}"

			end

		end


		if ((player_total > dealer_total) || dealer_total > 21) && (player_total < 22) && ((split_total > dealer_total) || dealer_total > 21) && (split_total < 22 && split_total > 0)
			
			puts "Player wins both hands."	

		elsif ((player_total > dealer_total) || dealer_total > 21) && (player_total < 22) || ((split_total > dealer_total) || dealer_total > 21) && (split_total < 22 && split_total > 0)
			
			puts "Player wins."

		elsif (dealer_total > player_total) && (dealer_total > split_total) && (dealer_total < 22)

			puts "Dealer wins"

		else

			puts "A tie."

		end

	else
	
		puts "Dealer wins."	

	end

		
end


play_black_jack


# print @deck

# print "\n"









