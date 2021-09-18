# README

* Ruby version 3.0.0

## Deployment instructions

- clone the repo
- execute `bundle install`
- execute `rails s`
- from another console execute `curl http://localhost:3000` 

## Configuration

You can modify the timeout variable for API calls in app/services/client_api_service.rb in order to stop waiting for the response
```
TIMEOUT = 2
```

## How to run the test suite

```
rspec .
```
