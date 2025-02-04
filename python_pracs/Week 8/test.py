import requests
import json
from datetime import datetime

# date = datetime.now().strftime("%Y-%m-%d")
print(datetime.now().strftime("%Y-%m-%d"))

# url = "https://weather-api167.p.rapidapi.com/api/weather/overview"

# querystring = {"place":"Kenya,Nairobi"}

# def quey(place):
#     headers = {
#         "x-rapidapi-key": "61791a0ffbmshbbedc2ac05ca4c7p1823dejsna4e747c4e9be",
#         "x-rapidapi-host": "weather-api167.p.rapidapi.com"
#     }

#     response = requests.get(url, headers=headers, params=querystring)

#     print(response.json())
#     return response.json()

# if __name__ == "__main__":
#     quey("Nairobi")