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

# Writing for loops

dog_names <- c("Teddy", "Khora", "Banjo", "Waffle")

# create example for one data element to put into for loop
# version with copy/pasting
print(paste("My dog's name is", dog_names[1]))
print(paste("My dog's name is", dog_names[2]))

# version with variable I can update
pupster <- dog_names[1]

print(paste("My dog's name is", pupster))

# convert to a for loop
for (pupster in dog_names){
  print(paste("My dog's name is", pupster))
}

# another for loop example

# practicing writing body
mass <- seq(from = 0, to = 3, by = 0.5)

i <- mass[1]
i

new_val <- i + 2 # adding 2 to each value
print(new_val)

# write into a for loop
for (i in mass){
  new_val <- i + 2 # adding 2 to each value
  print(new_val)
}

# practice same example with indexing
i < 1
new_val <- mass[i] + 2
print(new_val)

# write into a for loop- an i for each variable in mass
for (i in 1:length(mass)) { # defining iterator using length of vector
  new_val <- mass[i] + 2
  print(new_val)
}

for (i in seq_along(mass)){ # defining iterator using seq_along()
  new_val <- mass[i] + 2
  print(new_val)
}

# Another example with iterating by position (indexing)
tree_height <- c(1, 2, 6, 10)

for(i in seq_along(tree_height)){
  val <- tree_height[i] + tree_height[i+1]
  print(val)
}

# For loops with conditional statements
animal <- c("cat", "dog", "zebra", "dog")

for (i in seq_along(animal)){
  if (animal[i] == "dog"){
    print("I love dogs!")
  } else
    print("these are other animals!")
}

# animal species
species <- c("dog", "elephant", "goat", "dog", "dog", "elephant")

# and their respective ages in human years
age_human <- c(3, 8, 4, 6, 12, 18)

# convert ages to animal years using the following:
# 1 human year = 7 in dog years
# 1 human year = 0.88 in elephant years 
# 1 human year = 4.7 in goat years

# Allocate a space for our output
animal_ages <- vector(mode = "numeric", length = length(species))

for(i in seq_along(species)){
  if (species[i] == "dog"){
    animal_age <- age_human[i]*7
  }else if (species[i] == "elephant"){
    animal_age <- age_human[i]*0.88
  }else if (species[i] == "goat"){
    animal_age <- age_human[i]*4.7
  }
  animal_ages[i] <- animal_age # populate empty vector
}

animal_ages

# Another example of storing outputs of a for loop
tigers <- c(29, 34, 82)
lions <- c(2, 18, 6)

big_cats <- vector(mode = "numeric", length = length(tigers))

for (i in seq_along(tigers)){
  big_cats[i] <- tigers[i] + lions[i]
}

big_cats

# For loops across columns of a data frame

# create vector to store values
mean_mtcars <- vector(mode = "numeric", length = ncol(mtcars))

for (i in 1:ncol(mtcars)){
  mean_val <- mean(mtcars[[i]], na.rm = TRUE)
  mean_mtcars[[i]] <- mean_val
}

# A for loop over columns with a condition

library(palmerpenguins)

for (i in 1:ncol(penguins)){
  if(is.numeric(penguins[[i]])){
    penguin_median <- median(penguins[[i]], na.rm = TRUE)
    print(penguin_median)
  } else{
    print("data not numeric")
  }
}

# Functional programming

# apply() function iterates over columns or rows

# rewrite our for loop for finding mean values of the columns in mtcars

# MARGIN = 2 is by column, = 1 is by row
apply(X = mtcars, MARGIN = 2, FUN = mean)
# same as saying apply the function mean across the columns in mtcars

# dplyr::across(), group_by() and summarize() in combo

library(tidyverse)

penguins2 <- penguins %>% 
  group_by(species) %>% 
  summarize(across(where(is.numeric), mean, na.rm = TRUE))

view(penguins2)

# get back df with species x numeric column means

