# Sms notification project
## Techinical Objectives
* integrate 3rd party api
* utilize latest turbo/hotwire library in rails 7

## Environment setup
* Required env
```
ruby version: 2.7.2
rails version: Rails 7.0.8.4
```

* Start the databse
```
docker-compose up -d
```

* Start the rails server
```
bundle _2.4.22_ exec rails s
```

## Applying Rails 7 Turbo
### Generated Devise views
* Welcome page
    * Sign in button -> redirect to sign in page

* Signin page
    * Log in button -> redirect to home page
    * Sign up button -> redirect to sign up page

* Signup page
    * Sign up button -> redirect to home page

### Optimization with Turbo
* Welcome page
    * Sign in button -> replace button with the signin form

* Signin page
    * Log in button -> redirect to home page
    * Sign up button -> redirect to signup page

* Signup page
    * Sign up button -> redirect to home page
