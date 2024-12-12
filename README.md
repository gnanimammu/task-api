# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
rails new task-api --api
gem 'device'
gem 'device-jwt'
gem 'rack-cors'
bundle install

confi/initializers/cors.rb
 do some modifications
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ["Authorization"]
  end

rails g device:install
past in development.rb
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

uncomment line in device.rb
config.navigational_formats = []

rails g device user
rails g devise:controller users -c sessions registtrations

rails g migration addJtiToUsers jti:string:index:unique
rails g migration addPhoneToUsers phone:string

follow the steps in 
https://github.com/waiting-for-dev/devise-jwt

add column to jwt migration
rails db:migrate
add model class to  user model

add jwt secret key to devise.rb
and sign in,sign out and expiration time also

https://github.com/waiting-for-dev/devise-jwt/issues/235#issuecomment-1116864740

follow above page and apply in application.rb

rails g model Task title:string description:string status:string due_date:date
rails db:create db:migrate
gem 'timeliness'
bundle install

rails generate controller Tasks
 
create routes for Tasks
Rails.application.routes.draw do
  resources :tasks
end

POST /tasks: Creates a new task
POST /tasks
{
  "task": {
    "title": "Finish the report",
    "description": "Complete the final report for the project",
    "status": "pending",
    "due_date": "2024-12-15T12:00:00"
  }
}

PATCH /tasks/:id: Updates a specific task
PATCH /tasks/1
{
  "task": {
    "title": "Updated Task Title",
    "status": "in_progress"
  }
}


for users
POST /users: Creates a new task
{
    "user":{
        "email": "user216@example.com",
        "password": "123456"
        "phone":'12345678'
    }
}

DELETE /users: Deletes a new task
{
    "user":{
        "email": "user216@example.com",
        "password": "123456"
    }
}







* ...
