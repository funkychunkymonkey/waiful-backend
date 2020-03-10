# waiful-client

"This was created during our time as students at Code Chrysalis."

Revolutionise your laifu with Waiful, a health and wellness app that motivates you with your favourite waifus.

Let's use it for your life!

<img src="assets/waiful.png" width="400px">

## URL

You can try this app here.  
// deploy's URL

## Technology

some images from our presentation

## Backend Infrastructure

For this application, we used Ruby on Rails(6.0.2).

## Setup Instructions

Please clone it or download it, and open your command line, change your current directory to this backend system directory. After that, please do commands below.

### Install dependencies

- yarn

### Install bundler and refresh your ruby environment

- gem install bundler
- rbenv rehash

### Install dependencies for Ruby on Rails environment

- bundle install

### Create database environment

And you have to prepare your DB environment on your computer, after you finish preparing, you have to create `.env` that includes your db setting like below.

・RAILS_MAX_THREADS  
・DATABASE_USER  
・DATABASE_PASSWORD  
・DATABASE_HOST  
・DATABASE_NAME_DEVELOPMENT  
・DATABASE_NAME_TEST  
・DATABASE_NAME

Based on your RDBMS, create schema for this app, and do commands below.

- rails db:migrate
- rails db:seed

### Start server

- rails server

## Introducing the Team

#### Kan Phongjaroenwit(CEO)

[Github](https://github.com/kan4k4) | [LinkedIn](https://www.linkedin.com/in/contactkan/)

#### Sarah Ting (CTO)

[Github](https://github.com/sarahjting) | [LinkedIn](https://www.linkedin.com/in/sarahjting/)

#### Ryuki Kuga (Scrum Master)

[Github](https://github.com/ryukikikie) | [LinkedIn](https://www.linkedin.com/in/ryukikikie/)

#### Genta Shibasaki (Backend Lead)

[Github](https://github.com/GentaShibasaki) | [LinkedIn](https://www.linkedin.com/in/gentashibasaki/)

#### Haruna Utsumi (Frontend Lead)

[Github](https://github.com/harunamarun) | [LinkedIn](https://www.linkedin.com/in/harunamarun/)
