#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICE_LIST() {
  echo "$1"
  # Retrieve the list of services from the database
  SERVICE_LIST=$($PSQL "SELECT service_id, name FROM services")
  
  # Loop through each service and print it in a numbered list format
  echo "$SERVICE_LIST" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
}

SERVICE_MENU() {
  # Display the service list with a welcome message
  SERVICE_LIST "$1"
  read SERVICE_ID_SELECTED

  # Get the count of services
  SERVICE_COUNT=$($PSQL "SELECT COUNT(*) FROM services")
  SERVICE_COUNT=$(echo $SERVICE_COUNT | xargs)  # Trim any leading/trailing whitespace

  # if input is not in range
  if [[ ! "$SERVICE_ID_SELECTED" =~ ^[0-9]+$ ]] || (( SERVICE_ID_SELECTED < 1 || SERVICE_ID_SELECTED > SERVICE_COUNT )); then
    # repeat menu
    SERVICE_MENU "I could not find that service. What would you like today?"
  else
    # get name of service
    SERVICE_ORDER=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    SERVICE_ORDER=$(echo $SERVICE_ORDER | xargs)  # Trim any leading/trailing whitespace

    # if not available
    if [[ -z "$SERVICE_ORDER" ]]; then
      SERVICE_MENU "I could not find that service. What would you like today?"
    else
      # request client's number
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      # check CUSTOMER_PHONE record from customer database
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      CUSTOMER_NAME=$(echo $CUSTOMER_NAME | xargs)  # Trim any leading/trailing whitespace

      # if record does not exist
      if [[ -z "$CUSTOMER_NAME" ]]; then
        # request name
        echo "I don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        # save the record in database
        INSERT_CUSTOMER_RECORD=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      fi

      echo -e "\nWhat time would you like your $SERVICE_ORDER, $CUSTOMER_NAME?"
      read SERVICE_TIME

      # if SERVICE_TIME is empty
      while [[ -z "$SERVICE_TIME" ]]; do
        echo "Please enter a valid time for your $SERVICE_ORDER, $CUSTOMER_NAME:"
        read SERVICE_TIME
      done
      
      # get customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      CUSTOMER_ID=$(echo $CUSTOMER_ID | xargs)  # Trim any leading/trailing whitespace

      # insert into appointments
      INSERT_SERVICE_ORDERED=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

      echo "I have put you down for a $SERVICE_ORDER at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}

# Start the service menu
SERVICE_MENU "Welcome to My Salon, how can I help you?"
