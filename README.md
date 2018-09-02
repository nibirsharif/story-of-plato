# README

Welcome to the Story of Plato.

## Prerequisite

### Gems

* gem 'pg'
* gem 'annotate'
* gem 'bcrypt'
* gem 'bootstrap-sass', '3.3.7'
* gem 'jquery-rails'
* gem 'cancan'

## Setup

Install all ruby gems that are dependencies of this project.
```
$ bundle install
```

Run the following command to initialize your database schema along with seed data.
```
$ bundle exec rake db:create db:seed
```

Open another terminal window and run the following.
```
$ bundle exec rails server -b 0.0.0.0
```

## How To

* Go to `/signup` url to signup a new user

* Click on `login` button on the right side of the title bar. Default username `shariful@example.com` and password `abc123`

* On the `Account` section click on `Projects`.

* Click on a specific project item.

* You can see your `Boards`. Click on a board item to view all the cards.

* You can see relevant `Task` if you click on a board.
