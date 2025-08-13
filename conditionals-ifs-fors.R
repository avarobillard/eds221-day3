# Basic if statement 

burrito <- 1.5 # assigning object value

# write a short if statement
if(burrito > 2){
  print("I love burritos!")
}

# An example with strings 

my_ships <- c("Millenium Falcon", "X-wing", "Tie-Fighter", "Death Star")

stringr::str_detect(my_ships, pattern = "r") # asks: which elements in vector contain "r"

phrase <- "I love burritos!"

if (stringr::str_detect(phrase, "love")){
  print("Big burrito fan")
}

# Basic if-else statement

pika <- 59.1 # storing a value to an object 

if (pika > 60){ # define size of mega pikas
  print("mega pika")
} else { # otherwise, print normal
  print("normal pika")
} 

# Another example with strings

food <- "I love tacos!"

if(stringr::str_detect(food, pattern = "burritos")) {
  print("yay burritos!")
} else{
  print("what about burritos?")
}

# More options with if-else statements 
marmot <- 3.8

if (marmot < 0.5){ # defining small marmots
  print("small")
} else if (marmot >= 0.5 & marmot < 3) { # medium
  print("medium")
} else { # everything else is a large marmot
  print("large")
}

# Use the switch function to write complex if-else statements

species <- "mouse"

# all of this code is the same as several if-else statements 
switch(species,
       "cat" = print("meow"), # same as an if statement
       "dog" = print("woof"), # same as an else if statement
       "mouse" = print("squeak") #same as last else if statement
       )
# see next week dplyr::case_when()