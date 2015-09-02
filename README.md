### Random Pairing Method by Harriet Craven and Joe Zhou

This method aims to create a random pairing of names from an array of (unique) names.  The method takes in a mandatory argument of an array of names (unique string elements), and splat optional arguments of existing / past pairings in format of an array of arrays of name pairs, and return a array of new pairings (in format of array of arrays of name pairs) in which no pairing has happened in any of the past pairings.  For example

```ruby
names_array = ['David','Adam','Harry','James','Sarah','Lisa','Zack']
past_pairing1 = [['Adam','Harry'],['James','David'],['Sarah','Zack']]
past_pairing2 = [['Adam','James'],['Lisa','David'],['Harry','Zack']]
p random_pairing names_array, past_pairing1, past_pairing2  
# =>  [['James','Harry'],['Adam','David'],['Sarah','Lisa']]
```

* There is a outline sketch of the method idea at the beginning of the file to explain the overall idea. 
* The method test1 is setup as a demo of the method, run test1 to see it in action.
* There is a second version of the same method on the same file with lots of output comments to show different steps involved in the method code.  This is a useful as it shows exactly what is happening at each step of each iteration.
* The method test1 is setup as a demo of the second version of the method with comments, run test2 to see it in action.
* The file do_not_review_me.rb is where we store our previous attempts at the method - just there for our own records.
