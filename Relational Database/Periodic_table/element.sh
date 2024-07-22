#!/bin/bash

# connect to postgres database for periodic table
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# function to provide all interactivity
ATOM(){
  # checks if an argument was passed
  # checks if num of args equals one
  if [ $# -eq 1 ]; then
    # stores the argument into the variable input
    INPUT="$1"
  fi
  # if input does not exists
  while [[ -z $INPUT ]]; 
    do
      echo "Please provide an element as an argument."
      read INPUT
    done
  # check if input is a number
  if [[ $INPUT =~ [0-9]+ ]]; then
    # get details
    DETAILS=$($PSQL "SELECT atomic_number, name, symbol,type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties JOIN types USING(type_id) JOIN elements USING(atomic_number) WHERE (atomic_number=$INPUT)")
   else
    # change input to first letter capitalised
    # Change to all lower letter
    INPUT="${INPUT,,}"
    # capitalise first letter
    INPUT="${INPUT^}"
    # get details
    DETAILS=$($PSQL "SELECT atomic_number, name, symbol,type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties JOIN types USING(type_id) JOIN elements USING(atomic_number) WHERE (symbol='$INPUT') OR (name='$INPUT')")
  fi

    # discover if input exists as an element in the database
    # if details exists
    if [[ -n $DETAILS ]]; then
      # loop through details 
      echo $DETAILS | while IFS='|' read ATOMIC_NUM NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT    
      do
        # print the message about element
        echo -e "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
      # if details does not exist
     else
     # print element unfound
      echo "I could not find that element in the database."
    fi
  }

# calling the function
ATOM "$1"