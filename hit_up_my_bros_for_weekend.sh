#!/bin/bash

#To Do:  forward the text message throught my regular Goolge Voice #.
# Find a way to send  the text message  to many friends at the same time using a loop.

TO_NUMBER=('+1XXXXXXXXXX' 'Yu Li')

#TO_NUMBER('+1XXXXXXXXXX' 'Henry')

FROM_NUMBER='+1XXXXXXXXXX'

REASONS=('Any plan for the weekend?'
        "It's weekend. What are you up to?"
        'Want to hangout on the weekend?'
        "let's hit up some girls on the weekend?")

rand=$[ $RANDOM % ${#REASONS[@]} ]

RANDOM_REASON=${REASONS[$rand]}
MESSAGE="Hi, ${TO_NUMBER[1]}. "$RANDOM_REASON

# Send a text message
curl -X POST 'https://api.twilio.com/2010-04-01/Accounts/AC3ccecb19465510eaf8dd3acb21690370/Messages.json' \
--data-urlencode To=${TO_NUMBER[0]} \
--data-urlencode From=${FROM_NUMBER} \
--data-urlencode Body="$MESSAGE"  \
-u AC3ccecb19465510eaf8dd3acb21690370:4dbbaca1feef3a43be782fcf2b01bf09 >>hit_up_my_bros_for_weekend_log.txt

echo $(date) >>hit_up_my_bros_for_weekend_log.txt
