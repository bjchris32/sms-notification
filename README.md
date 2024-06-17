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

* Set up database
```
rake db:create
rake db:migrate
```

* Start the sidekiq in background and log to `log/sidekiq.log`
```
nohup bundle exec sidekiq -e development &>./log/sidekiq.log &

# kill the sidekiq after any config modification
ps aux | grep sidekiq
kill -TERM PID
```

* Start the rails server
```
bundle _2.4.22_ exec rails s
```

* Monitor the job execution at the route: http://localhost:3000/sidekiq/

## Applying Rails 7 Turbo
### Generated Devise views
* Welcome page
    * Sign in button -> redirect to sign in page
    * Log in button -> redirect to home page

### Optimization with Turbo
* Welcome page
    * Sign in button -> replace button with the signin form
    * Log in button -> replace button with the login form
