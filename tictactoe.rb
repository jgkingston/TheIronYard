puts "Welcome to our game of Tic Tac Toe!"

# Objective is to get 3 X's or 3 O's in a row/column/diagonal

# Present a board

@board = [
	[1,2,3],
	[4,5,6],
	[7,8,9]
]

win = false
turn = 0

def display_board
	puts "#{@board[0][0]}|#{@board[0][1]}|#{@board[0][2]}"
	puts "-----"
	puts "#{@board[1][0]}|#{@board[1][1]}|#{@board[1][2]}"
	puts "-----"
	puts "#{@board[2][0]}|#{@board[2][1]}|#{@board[2][2]}"
end

def take_turn turn
	mark = ""
	if turn % 2 + 1 == 1
		mark = "X"
	else
		mark = "O"
	end
	puts "Player #{turn % 2 + 1}, your turn."
	valid = false
	while valid == false
		choice = gets.chop.to_i 
		# puts choice
		if choice > 0 and choice < 10
			valid = true
			# puts valid
			# puts turn
			@board.each do |row|
				if row.include?(choice)
					row.delete_at(choice % 3 - 1)
					row.insert(choice % 3 - 1, mark)
				end
			end
		else
			puts "Not a valid cell. Pick again."
		end
	end

end

def check_win
	
	r1 = @board[0].to_s
	r2 = @board[1].to_s
	r3 = @board[2]
	c1 = @board[0][0].to_s + @board[1][0].to_s + @board[2][0].to_s
	c2 = @board[0][1].to_s + @board[1][1].to_s + @board[2][1].to_s
	c3 = @board[0][2].to_s + @board[1][2].to_s + @board[2][2].to_s
	d1 = @board[0][0].to_s + @board[1][1].to_s + @board[2][2].to_s
	d2 = @board[0][2].to_s + @board[1][1].to_s + @board[2][0].to_s
	
	win_conditions = [r1,r2,r3,c1,c2,c3,d1,d2]
	
	
end



while win == false && turn < 10
	display_board
	take_turn(turn)
	turn += 1
	check_win

end



# board.each do |row|
# 	game_row = ""
# 	row.each do |square|
# 		case square
# 		when 0
# 			game_row += '_'
# 		when 1
# 			game_row += 'X'
# 		when 2
# 			game_row += 'O'
# 		end
# 	end
# 	puts game_row
# end

# Player 1 makes a choice
# Save that choice
# Did player 1 win? If so, end the game
# If not, Player 2 makes a choice
# Save that choice
# Did player 2 win? If so, end the game
# If not, Player 1 makes a choice

