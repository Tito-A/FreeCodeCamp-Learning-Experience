#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # checking to remove first line
  if [[ $OPPONENT != "opponent" ]]
  then
    # inserting values into the teams table
      # get the team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT' ")
      #if team_id not found
      if [[ -z $TEAM_ID ]]
      then
        # insert into database
        INSERT_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        
      fi
      # get new team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    #works alright up to here

    # inserting values into the games table
      #define winner_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      
      # check that winner is winner id
      if [[ -z $WINNER_ID ]]
        then
        INSERT_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      fi
      # insert game data
      # insert the values into games table
      INSERT_GAMES_ROW=$($PSQL "INSERT INTO games(year,round,winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR,'$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID)")
    
    
        
    
      

    # closing check on first line
  fi


done
