def random_pair1 array
length = array.length
array.shuffle!
if length.odd?
	p"You need to have an even number of people to pair"
	p 
	p"So I have removed somebody randomly"
	p
	p "The unlucky person is"
	loner = array.pop
	p loner.to_s
end
	puts "Here are the random pairings"
	
	array.each_slice(2) do |b|
    p b[0] + ' is paired with ' + b[1]
end
end


def random_pair array
	array.shuffle!
	result = []
	if array.length.odd?
		array.pop
	end 
	array.each_slice(2) do |b|
		array1 = []
	    array1 << b[0]
	    array1 << b[1]
	    result << array1
	end
	return result
end




people = ['Harriet','Lucy','Joe','Tim','Sarah','Usman','Matt','Adrian','Yana']
pairing1 = [["Yana", "Joe"], ["Usman", "Matt"], ["Adrian", "Sarah"], ["Lucy", "Tim"]]
pairing2 = [["Sarah", "Yana"], ["Lucy", "Matt"], ["Tim", "Usman"], ["Adrian", "Harriet"]]




def new_pairing(names_array,*paired_names)
	original_people_array = names_array
	original_paired_names = paired_names


	new_pair = random_pair(names_array)
	new_pair.each do |pair| 
		pair.sort!
	end
	#p new_pair
	existing_pairs = paired_names.each do |pair| 
		pair.sort!
	end
	#p existing_pairs

	p names_array

	for i in 0...new_pair.length do
		for j in 0...existing_pairs.length do
			if existing_pairs[j] == new_pair[i]
				return new_pairing(original_people_array,original_paired_names)
			end
		end
	end



	return new_pair

end





def new_pairing1(names_array,*paired_names)
	original_people_array = names_array
	original_paired_names = paired_names


	new_pair = random_pair(names_array)
	new_pair.each do |pair| 
		pair.sort!
	end
	#p new_pair
	existing_pairs = paired_names.flatten(1).each do |pair| 
		pair.sort!
	end
	#p existing_pairs

	p names_array

	for i in 0...new_pair.length do
		for j in 0...existing_pairs.length do
			if existing_pairs[j] == new_pair[i]
				return new_pairing(original_people_array,original_paired_names)
			end
		end
	end



	return new_pair
	#*paired_names (splat) will be arrays of paired names of the pairing that already taken
	#place.  There may be more than one say:  [["Harry","James"],["Amy","David"]],
	#[["Harry","David"],["Yang","Bradley"],["Lisa","Olivia"]].
	#the function needs to return a random pairing array which no pairing is a repeat 
	#from pairing that has already taken place.
	#for best practice: try to make the script efficient (fast) as possible.
end

p new_pairing(people, pairing1, pairing2)

#p new_pairing(['A','B','C','D','E','F'],[['A','C'],['B','D']],[[],[],[]])

#[[],[],[]]
