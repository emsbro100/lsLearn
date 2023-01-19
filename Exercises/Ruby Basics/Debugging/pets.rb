pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog].push 'bowser'

p pets #=> {:cat=>"fluffy", :dog=>["sparky", "fido", "bowser"], :fish=>"oscar"}

# Fixed by using the #push Array method to add bowser to the :dog array, rather
# than reassigning it from an array to the string 'bowser'.