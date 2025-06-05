#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # check weather column name
  if [[ $YEAR != 'year' ]]
    then
      # insert winner team if not exists
      WINNER_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
      if [[ -z $WINNER_TEAM_ID ]]
        then
          # if empty insert this team
          INSERT_WINNER_TEAM="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"
          # get team_id
          WINNER_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
        fi

      # insert opponent team if not exists
      OPPONENT_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
      if [[ -z $OPPONENT_TEAM_ID ]]
        then
          # if empty insert this team
          INSERT_WINNER_TEAM="$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"
          # get team_id
          OPPONENT_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
        fi
    
      # insert games
      INSERT_GAME="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
    fi
done