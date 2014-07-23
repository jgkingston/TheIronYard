variable_name = [1,2,3,4]
character_1 = {
	name: "Mario",
	body_structure: "short fat",
	clothing: ["overalls", "red hat", ":{"],
	health: 100,
	damage: 2
}
character_2 = {
	name: "Snips",
	body_structure: "short lean",
	clothing: ["fur", "collar"],
	health: 10000,
	damage: 20
}
character_3 = {
	name: "Bob",
	body_structure: "huge muscle everywhere",
	clothing: ["jean everything"],
	health: 1,
	damage: 1
}

char_array = [character_1, character_2, character_3]
combat_1 = char_array.shuffle![0]
combat_2 = char_array[1]

# puts combat_1[:name], combat_1[:health]
# puts combat_2[:name], combat_2[:health]


# def check_win char1, char2
# 	if char1[:health] > 0
# 		puts char1[:name] + " wins"
# 	else
# 		puts char2[:name] + " wins"
# 	end
# end

# while (combat_1[:health] > 0) && (combat_2[:health] > 0)

# 	puts combat_1[:name], combat_1[:health]
# 	puts combat_2[:name], combat_2[:health]

# 	combat_1[:health] -= combat_2[:damage]
# 	combat_2[:health] -= combat_1[:damage]

# end

# check_win(combat_1,combat_2)


a = [
	[1,2,3,4],
	[5,6,7,8],
	[9,10,11,12]
]
a.each do |element|
	element.each  do |inner_element|
		puts inner_element.to_s + " some cool stuff"
	end
end

