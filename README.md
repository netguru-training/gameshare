[![Build Status](https://travis-ci.org/netguru-training/gameshare.svg?branch=master)](https://travis-ci.org/netguru-training/gameshare)

GamesShare is an application for gamers who want to trade their games with others.

https://still-stream-7949.herokuapp.com/

## Setup

```
git clone git@github.com:netguru-training/gameshare.git
cp db/database_example.yml db/database.yml
bundle
rake db:create
rake db:migrate
rake db:seed
```

### Omniauth

Register your application with Facebook:

* Log in to your facebook account, go to https://developers.facebook.com/
* Click on Apps, Add a new app. There will be a pop up, select website as a platform.
* Name your application, create new Facebook app ID. Select category(keep everything else as it is) and create App ID.
* Scroll down and Enter site URL as http://localhost:3000/ which is your default local rails server. Scroll down and click on Skip to Developer Dashboard in Next steps section.
* Go to Settings and enter your email address in Contact Email. Save changes.
* Go to status and Review, toggle “Do you want to make this app and all its live features available to the general public?” to yes.
* The whole purpose of step 1 was to get App ID & App secret and to activate the application so we can make calls from our web application.


Declare the provider in your config/initializers/devise.rb:
```
config.omniauth :facebook, "APP_ID", "APP_SECRET"
```

### Youtube
Create a developer key here http://code.google.com/apis/youtube/dashboard.

Add your key in config/youtube.yml:
```
dev_key: 'API_KEY'
```

## Requirements
* Ruby 2.1.5
* Rails 4.1.8
* PostgreSQL

## Team
[@vircung](https://github.com/vircung)
[@igatto](https://github.com/igatto)
[@JBanas](https://github.com/JBanas)

## Licence

The MIT License (MIT)

Copyright (c) 2014 netguru.co

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
