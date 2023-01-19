# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase.to_sym

player.merge!(character_classes[input])

puts 'Your character stats:'
puts player

# There are two problems with the program. The first is that within merge it is
# trying to select a key using a string and not a symbol, which results in
# nothing being selected. 
# The second is that merge does not mutate its caller, which means player.merge
# is evaluated but not assigned to anything.

# The first problem can by fixed by adding #to_sym to the end of the gets
# method chain.
# The second problem can be fixed by either adding a bang after merge or by
# assigning player to the returned value of the merge call.