# Sms notification project
## Techinical Objectives
* use background job to increase user experience when integrating 3rd party api
* utilize turbo in rails 7 to achieve single page application with less javascript

## Environment setup

This project is operating in hybrid mode, meaning some services are hosted on docker and some are on local machine.
- Services on docker: postgres, redis
- Services on local machine: rails, sidekiq

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

* Env variable for twilio.
Remember to rename the `.env.sample` to `.env` and assign the corresponding values from your twilio account.

* Start the sidekiq server on local machine and log to `log/sidekiq.log`
```
nohup bundle exec sidekiq -e development &>./log/sidekiq.log &
```

* Build tailwind css
```
rake tailwindcss:build
```

* Start the rails server on local machine
```
./bin/dev
```

* Monitor the job execution at the route: http://localhost:3000/sidekiq/

* Terminate the background job server
```
# kill the sidekiq server after any config modification
ps aux | grep sidekiq
kill -TERM PID
```

## Time spent
* Env setup: 1.5 hour
* Login system: 1 hour
* Turbo frame: 3 hour
* sms service: 1 hour
* Background job: 2 hour
* CSS adjustment: 1 hour
* Video making: 1.5 hour

Total: 11 hours
