# Car Dealership Manager App

This application was generated with Ruby on Rails. This is a CRUD application for Car Dealership.

### Ruby on Rails
This application requires:
* ruby 3.1.2

### Database
This application uses Postgresql 12.1 with ActiveRecord

### Development
* Template Engine: ERB
* Testing Framework: RSpec and Factory Bot
* Authentication: Devise
* Authorization: Pundit

## Deploy local through RVM and Ruby
```
rvm install 3.1.2
```
Learn more about [RVM](https://rvm.io/rvm/install) installation

### Install dependencies
Using [Bundler](https://github.com/bundler/bundler)
```
gem install bundler -v 2.3.25
bundle
```

### Task for initial development setup

```
rails db:create
rails db:migrate
```

### Start rails server
```
rails s -b 0.0.0.0 -p 3000
```

### To run the tests, execute the command bellow
```
rspec
```