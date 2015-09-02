#Method sketch
#Create an existing_pairs hash based on *paired_lst, with keys been names of people
#value take form of an array of names of those who has paired with that key. 
#i.e. the existing_pairs hash looks like:
#{"Yana"=>["Joe", "Sarah"], "Joe"=>["Yana", "Usman"], "Usman"=>["Joe", "Matt", "Tim"]...}
#Next do iteratively the following 
#     1.  Take the first name of the names array
#	  2.  Create a copy (called hat) of the names array, without names of those who paired with
#         the first person already, as well as without name of the firs person.
#     3.  Pick a random name out from the hat (this reduced copy of names array) to pair with the 
#         person from 1.  This ensures the pairing has not happened previously.
#     4.  Add this new pairing to the existing_pairing hash.
#     5.  Remove these two names from the original names array, so the names array is reducing.
#     6.  Appending the new pairing to a results array for eventual return.
#Until names array is empty or only one name left (odd number of names).
#Finally return results array of new pairings.

def random_pairing(names, *paired_list)
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

	while names.length >= 2

		name = names[0]
		pair_array = []
		pair_array << name
		if existing_pairs.has_key?(name)
			hat = names - existing_pairs[name]
		else
			hat = names - []  #seems - [] actually creates a DEEP copy of names!...interesting
		end
		hat.delete(name)
		index = rand(0..hat.length-1)
		pair_array << hat[index]
		names.delete(hat[index]); names.delete(names[0])	
		results << pair_array

		if existing_pairs.has_key?(pair_array[0]) == false
			existing_pairs[pair_array[0]] = []
		end
		existing_pairs[pair_array[0]] << pair_array[1]

		if existing_pairs.has_key?(pair_array[1]) == false
			existing_pairs[pair_array[1]] = []
		end
		existing_pairs[pair_array[1]] << pair_array[0]

	end

	return results 
end

def test1
	people = ['Yana','Harriet','Lucy','Joe','Tim','Sarah','Usman','Matt','Adrian']
	pairing1 = [["Yana", "Joe"],["Joe","Usman"]]
	pairing2 = [["Usman", "Matt"], ["Adrian", "Sarah"], 
		["Lucy", "Tim"],["Sarah", "Yana"], ["Lucy", "Matt"], ["Tim", "Usman"], 
		["Adrian", "Harriet"]]
	p random_pairing(people,pairing1,pairing2) #for testing of version2
end

#This is a copy of the same code with comments to help see it working in steps.
def random_pairing_with_comments(names, *paired_list)
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
	p names
	puts 'Below are the people each person has paired with already:'
	p existing_pairs   #to comment out after testing
	puts ''
	while names.length >= 2
		name = names[0]

		pair_array = []
		pair_array << name

		if existing_pairs.has_key?(name)
			hat = names - existing_pairs[name]
		else
			hat = names - []  #seems - [] actually creates a DEEP copy of names!...interesting
		end
		hat.delete(name)
		puts "Now we have #{name}, we need to pick someone from #{hat}"
		index = rand(0..hat.length-1)
		pair_array << hat[index]
		names.delete(hat[index])
		names.delete(names[0])	
		results << pair_array
		puts "We picked #{pair_array[1]}, so the new pair is #{pair_array}"
		puts "Now we have #{names} left to pair up."

		if existing_pairs.has_key?(pair_array[0]) == false
			existing_pairs[pair_array[0]] = []
		end
		existing_pairs[pair_array[0]] << pair_array[1]

		if existing_pairs.has_key?(pair_array[1]) == false
			existing_pairs[pair_array[1]] = []
		end
		existing_pairs[pair_array[1]] << pair_array[0]
		puts "Updating existing pairing to include this new pairing:"
		p existing_pairs
		p "Ready for the next person."
		puts ''

	end
	return results 
end

def test2 
	people = ['Yana','Harriet','Lucy','Joe','Tim','Sarah','Usman','Matt','Adrian']
	pairing1 = [["Yana", "Joe"],["Joe","Usman"]]
	pairing2 = [["Usman", "Matt"], ["Adrian", "Sarah"], 
		["Lucy", "Tim"],["Sarah", "Yana"], ["Lucy", "Matt"], ["Tim", "Usman"], 
		["Adrian", "Harriet"]]
	p random_pairing_with_comments(people,pairing1,pairing2) #for testing of version2
end


