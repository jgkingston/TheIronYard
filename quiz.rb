# 7.22.14
# Hash Quiz
# Created by Jamie Kingston

# Create module that Nick can use to take a multiple choice quiz. 10 - 20 questions 
# stored in a hash. At the end display % correct or number correct 
# compared to total number of questions.



# Assign index position to letter reponses for interchangeability
choices = ["a","b","c","d"]

# Keep track of which ones they got right
correct_responses = []

# Keep running score for display at the end
number_right = 0

# Battery of questions
quiz =[
{
	question: "What is best in life? ",
	answer: "c",
	answer_choices: [
		"Beer.",
		"The open steppe, a fleet horse, falcons at your wrist, and the wind in your hair.",
		"To crush your enemies, see them driven before you, and to hear the lamentation of their women.",
		"None of the above."
	]
},
{
	question: "How many roads must a man walk down? ",
	answer: "d",
	answer_choices: [
		"One",
		"Two",
		"All of them.",
		"I have a car, yo!"
	]
},
{
	question: "22 % 3 = ",
	answer: "c",
	answer_choices: [
		"3",
		"7.33333",
		"1",
		"None of the above."
	]
},
{
	question: "How would you like your steak cooked?",
	answer: "b",
	answer_choices: [
		"Rare",
		"Medium-Rare",
		"Medium",
		"Well-Done"
	]
},
{
	question: "Who would win? Zeus or Thor?",
	answer: "a",
	answer_choices: [
		"Thor",
		"Zeus",
		"Jupiter",
		"Yoda"
	]
},
{
	question: "How many tacos should I order?",
	answer: "c",
	answer_choices: [
		"One",
		"Two",
		"Three",
		"All of them!"
	]
},
{
	question: "Would you like another Margarita?",
	answer: "a",
	answer_choices: [
		"Yes!",
		"No.",
		"What else do you have?",
		"I'll have a pitcher, please!"
	]
},
{
	question: "8 // 5 = ",
	answer: "a",
	answer_choices: [
		"1",
		"3",
		"1.6",
		"None of the above."
	]
},
{
	question: "How do you like your eggs?",
	answer: "d",
	answer_choices: [
		"Scrambled",
		"Over-Easy",
		"Poached",
		"In a biscuit"
	]
},
{
	question: "Did these questions seem a little arbitraty to you?",
	answer: "a",
	answer_choices: [
		"Not at all!",
		"Why yes.",
		"Meh",
		"I refuse to play your games."
	]
},
]

# Standard function to check responses
def check_answer response, answer
	response == answer
end

# Administers the quiz and keeps score

quiz.each do |question|
	print "\n"
	puts "Question #{quiz.index(question) + 1} of #{quiz.length}"
	puts question[:question]
	question[:answer_choices].each_index do |i|
		print choices[i] + ". "
		puts question[:answer_choices][i]
	end
	valid_answer = false
	while valid_answer == false
		print "Answer: "
		response = gets.chomp.downcase
		if choices.include?(response)
			valid_answer = true
			if check_answer(response, question[:answer])
				correct_responses.push(1)
				number_right += 1
			else
				correct_responses.push(0)
			end
		else
			puts "Not a valid answer."
		end
	end
end

# Modifying end of quiz message intro

if number_right > 7
	
	print "Congratulations! "
	
elsif number_right > 5

	print "Not bad. "

elsif number_right > 3

	print "Could be worse. "

else

	print "Oh dear."
	
end

# Standard message with interpolated results

puts "You got #{number_right} out of #{quiz.length} right."

puts "Thanks for playing!"

puts "\nThe correct answers were:"

quiz.each do |question|
	print "#{quiz.index(question) + 1}. "
	print question[:answer] + "   "
	puts question[:answer_choices][choices.index(question[:answer])]
end




