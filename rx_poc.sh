#! /bin/bash

echo 'Enter the city name:'
read city_name
#city_name=Karlsruhe
curl -s wttr.in/$city_name?format=j1 --output weather_report.json
