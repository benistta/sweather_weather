## Table of Contents
1. [ About the Project](#about)
2. [ Versions ](#versions)
3. [ Schema ](#schema)
4. [ Setup. ](#setup)
5. [ Endpoints ](#endpoints )
6. [ Consumed Endpoints ](#consumed )
7. [ Technologies ](#technologies)
8. [ Testing ](#testing)
9. [ Contributors ](#contributors)

<a name="about"></a>
## 1. About The Project

Sweater Weather is designed as an application to help users better plan road trips. The app includes weather forecasts for the destination city at your estimated arrival time along with Yelp restaurant suggestions at the destination city.

<a name="versions"></a>
## 2. Versions
- Ruby 2.7.4
- Rails 5.2.6

<a name="schema"></a>
## 3. Schema

![Screen Shot 2022-08-10 at 1 34 51 AM](https://user-images.githubusercontent.com/92293363/183842357-e157a9ce-70ab-475a-80ff-64fe9b4307ff.png)

<a name="setup"></a>
## 4. Setup

1. Fork and Clone the repo: [GitHub - benistta-turing/sweater_weather](https://github.com/benistta/sweather_weather)
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{create,migrate}`
4. Get OpenWeather API key [here](https://openweathermap.org/)
5. Get MapQuest Geocoding API key [here](https://developer.mapquest.com/documentation/geocoding-api/)
6. Get Yelp API key [here](https://www.yelp.com/developers/documentation/v3)
7. Setup Figaro: `bundle exec figaro install`
8. Add API keys to `config/application.yml`
9. Run rails db: {:drop, :create, :migrate, :seed}

<a name="endpoints"></a>
## 5. Endpoints

#### Retrieve weather for a city:
`GET /api/v1/forecast?location=denver,co`

*Response*

```json
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-06-07 22:32:53 -0700",
                "sunrise": "2022-06-07 04:32:14 -0700",
                "sunset": "2022-06-07 19:25:42 -0700",
                "temperature": 58.6,
                "feels_like": 57.16,
                "humidity": 64,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "broken clouds",
                "icon": "04n"
            },
            "daily_weather": [
                {
                    "date": "2022-06-07",
                    "sunrise": "2022-06-07 04:32:14 -0700",
                    "sunset": "2022-06-07 19:25:42 -0700",
                    "max_temp": 80.56,
                    "min_temp": 55.71,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "date": "2022-06-08",
                    "sunrise": "2022-06-08 04:32:01 -0700",
                    "sunset": "2022-06-08 19:26:16 -0700",
                    "max_temp": 81.36,
                    "min_temp": 55.85,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "date": "2022-06-09",
                    "sunrise": "2022-06-09 04:31:51 -0700",
                    "sunset": "2022-06-09 19:26:49 -0700",
                    "max_temp": 90.37,
                    "min_temp": 63.5,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2022-06-10",
                    "sunrise": "2022-06-10 04:31:42 -0700",
                    "sunset": "2022-06-10 19:27:21 -0700",
                    "max_temp": 91.92,
                    "min_temp": 63.21,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "date": "2022-06-11",
                    "sunrise": "2022-06-11 04:31:35 -0700",
                    "sunset": "2022-06-11 19:27:50 -0700",
                    "max_temp": 92.66,
                    "min_temp": 69.24,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "22:00:00",
                    "temperature": 59.65,
                    "conditions": "light rain",
                    "icon": "10n"
                },
                {
                    "time": "23:00:00",
                    "temperature": 58.6,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "00:00:00",
                    "temperature": 58.62,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "01:00:00",
                    "temperature": 57.88,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "02:00:00",
                    "temperature": 57.29,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "03:00:00",
                    "temperature": 56.52,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "04:00:00",
                    "temperature": 55.85,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "05:00:00",
                    "temperature": 56.12,
                    "conditions": "broken clouds",
                    "icon": "04d"
                }
            ]
        }
    }
}
```


#### Register as a user:
``POST /api/v1/users``

*Request*


Request body:
```json
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```


#### Sessions User Login:
``POST /api/v1/sessions``

*Response*
```json
{
    "data": {
      "type": "users",
      "id": "1",
      "attributes": {
          "email": "whatever@example.com",
          "api_key": "jgn983hy48thw9begh98h4539h4"
        }
    }
}
```


#### Create Road Trip:
``POST /api/v1/road_trip``

*Response*
```json
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "new york, ny",
            "end_city": "los angeles, ca",
            "travel_time": "40:16:00",
            "weather_at_eta": {
                "temperature": 91.33,
                "conditions": "few clouds"
            }
        }
    }
}
```
<a name="consumed"></a>
## 6. Consumed Endpoints


- Used

    - OpenWeather
      - [One Call API 1.0](https://openweathermap.org/api/one-call-api)
        - Used for weather forecast data. We are utilizing Current, Hourly, and Daily data.
    - MapQuest
      - [Directions API - Route](https://developer.mapquest.com/documentation/directions-api/route/get)
        - Used for getting drive time to determine ETA for destination
      - [Geocoding API - Address](https://developer.mapquest.com/documentation/geocoding-api/address/get)
        - Used for retrieving latitude and longitude coordinates for destination, which is then passed into the OpenWeather API
    - Yelp Fusion
      - [Business Search](https://www.yelp.com/developers/documentation/v3/business_search)
        - Used to search for restaurants at city that matches food/restaurant type selected in request

<a name="technologies"></a>  
## 7. Technologies
<img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white" />
<img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white" />
<img src="https://img.shields.io/badge/Atom-66595C?style=for-the-badge&logo=Atom&logoColor=white" />
<img src="https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white" />
<img src="https://user-images.githubusercontent.com/64919819/113648232-81d60d00-9649-11eb-8ea4-0ff5e399afb6.png" />
<img src="https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white" />
<img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" />
<img src="https://user-images.githubusercontent.com/64919819/113648167-6965f280-9649-11eb-8794-0f1082ae8d1c.png" />  

<a name="testing"></a>
## 8. Testing

  - This application is fully tested through RSpec.
  - You can run RSpec on any directory/file using `bundle exec rspec <directory/file>`
  - SimpleCov is included to ensure tests have full coverage.
  - To run the Simplecov report type the following into your terminal: `open coverage/index.html`
  - See details here: [SimpleCov](https://github.com/simplecov-ruby/simplecov)

<a name="contributors"></a>
## 9. Contributors
  Becky Nisttahuz
