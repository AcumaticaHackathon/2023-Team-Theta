#!/bin/bash

validateProject='{"isMergeWithExistingPackages": false,"isOnlyValidation": true,"isOnlyDbUpdates": false,"isReplayPreviouslyExecutedScripts": false,"projectNames": [ "theta-project" ],"tenantMode": "Current"}'
publishProject='{"isMergeWithExistingPackages": false,"isOnlyValidation": false,"isOnlyDbUpdates": false,"isReplayPreviouslyExecutedScripts": false,"projectNames": [ "theta-project" ],"tenantMode": "Current"}'
curl --location --request POST 'https://hackathon.acumatica.com/Theta/CustomizationApi/publishBegin' --header 'Content-Type: application/json' -d "$validateProject" -i -b cookies.txt


        for i in {1..5}; do
          curl --location --request POST 'https://hackathon.acumatica.com/Theta/CustomizationApi/publishEnd' --header 'Content-Type: application/json' -d "" -i -b cookies.txt -o response.txt
          rm ./request.txt
          if [[ $(cat response.txt) == *"isCompleted\":true,\"isFailed\":false"* ]]; then
            curl --location --request POST 'https://hackathon.acumatica.com/Theta/CustomizationApi/publishBegin' --header 'Content-Type: application/json' -d "$publishProject" -i -b cookies.txt
            echo "Your Project has been Published"
            break
          elif [[ $(cat response.txt) == *"isCompleted\":true,\"isFailed\":true"* ]]; then
            echo "Your Validation Failed"
            break
          else
            sleep 120
          fi
        done