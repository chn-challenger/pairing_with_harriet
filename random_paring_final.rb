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

$num_of_recurs = 0
def random_pairing_v1(names_array, paired_names)
	original_people_array = []
	names_array.each do |name|
			original_people_array << name
	end
	original_paired_names = []
	paired_names.each do |pairs|
		original_paired_names << pairs
	end
	new_pair = random_pair(names_array)
	new_pair.each do |pair| 
		pair.sort!
	end
	existing_pairs = paired_names.each do |pair| 
		pair.sort!
	end
	for i in 0...new_pair.length do
		for j in 0...existing_pairs.length do
			if existing_pairs[j] == new_pair[i]
				$num_of_recurs +=1
				puts "#{$num_of_recurs} recursions happened."
				return random_pairing_v1(original_people_array,original_paired_names)
			end
		end
	end
	return new_pair
end

# people = ['Yana','Harriet','Lucy','Joe','Tim','Sarah','Usman','Matt','Adrian']
# pairing1 = [["Yana", "Joe"],["Joe","Usman"], ["Usman", "Matt"], ["Adrian", "Sarah"], 
# 	["Lucy", "Tim"]]
# puts 'About to test random pairing version 1 with recursion.'
# p random_pairing_v1(people,pairing1)

def random_pairing_v2(names, *paired_list)
	pairs = paired_list.flatten(1)
	results = []; existing_pairs = {}
	pairs.each do |pairs|
		if existing_pairs.has_key?(pairs[0])
			existing_pairs[pairs[0]] << pairs[1]
		else
			existing_pairs[pairs[0]] = []
			existing_pairs[pairs[0]] << pairs[1]
		end
		if existing_pairs.has_key?(pairs[1])
			existing_pairs[pairs[1]] << pairs[0]
		else
			existing_pairs[pairs[1]] = []
			existing_pairs[pairs[1]] << pairs[0]
		end
	end
	#p existing_pairs   #uncomment to see the existing pair hash, 
	while names.length >= 2
		name = names[0]
		pair_array = []
		pair_array << name
		hat = names - existing_pairs[name]
		hat.delete(name)
		index = rand(0..hat.length-1)
		pair_array << hat[index]
		names.delete(hat[index])
		names.delete(names[0])	
		results << pair_array
		existing_pairs[pair_array[0]] << pair_array[1]
		existing_pairs[pair_array[1]] << pair_array[0]
	end
	return results 
end


# people = ['Yana','Harriet','Lucy','Joe','Tim','Sarah','Usman','Matt','Adrian']
# pairing1 = [["Yana", "Joe"],["Joe","Usman"], ["Usman", "Matt"], ["Adrian", "Sarah"], 
# 	["Lucy", "Tim"]]
# pairing2 = [["Sarah", "Yana"], ["Lucy", "Matt"], ["Tim", "Usman"], 
# 	["Adrian", "Harriet"]]

# puts ''
# puts 'About to test random pairing version 2 with no recursion'
# p random_pairing_v2(people, pairing1,pairing2)

array1 = ['person1','person2','person3','person4','person5','person6','person7','person8','person9','person10']
test1 = [["person8", "person6"], ["person7", "person10"], ["person9", "person1"], ["person4", "person5"], ["person2", "person3"]]
test2 = [["person1", "person3"], ["person2", "person9"], ["person4", "person10"], ["person5", "person6"], ["person7", "person8"]]
test3 = [["person1", "person7"], ["person2", "person8"], ["person3", "person4"], ["person5", "person9"], ["person6", "person10"]]
test4 = [["person1", "person2"], ["person3", "person5"], ["person4", "person7"], ["person6", "person9"], ["person8", "person10"]]
test5 = [["person1", "person4"], ["person2", "person10"], ["person3", "person6"], ["person5", "person7"], ["person8", "person9"]]
test6 = [["person1", "person8"], ["person2", "person7"], ["person3", "person9"], ["person4", "person6"], ["person5", "person10"]]
test7 = [["person1", "person10"], ["person2", "person6"], ["person3", "person7"], ["person4", "person9"], ["person5", "person8"]]
test8 = [["person1", "person6"], ["person2", "person5"], ["person3", "person10"], ["person4", "person8"], ["person7", "person9"]]


tests = []; tests << test1; tests << test2; tests << test3; tests << test4; tests << test5
tests << test6; tests << test7; tests << test8
tests = tests.flatten(1)
p random_pairing_v1(array1, tests)
p "let's try version 2..."
p random_pairing_v2(array1, test1, test2, test3, test4, test5, test6, test7, test8)
# some error code
# /Users/joekelly/Desktop/Projects/pairing/pair_with_harriet/random_paring_final.rb:74:in `[]': no implicit conversion from nil to integer (TypeError)
# 	from /Users/joekelly/Desktop/Projects/pairing/pair_with_harriet/random_paring_final.rb:74:in `random_pairing_v2'
# 	from /Users/joekelly/Desktop/Projects/pairing/pair_with_harriet/random_paring_final.rb:103:in `<main>'
# [Finished in 0.1s with exit code 1]
