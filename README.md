# waiful-backend

**This was created during our time as students at Code Chrysalis.**

Revolutionise your laifu with Waiful, a health and wellness app that motivates you with your favourite waifus.

Let's use it for your life!

<img src="https://user-images.githubusercontent.com/56245555/76932158-9c99ee80-692d-11ea-9cec-fbef66e13374.png" width="700px">

## URL

You can try this app here.  
https://apps.apple.com/jp/app/waiful/id1502803346?mt=8

# Technology

- [WGER Workout Manager API](http://wger.de/en)
  - Used for information regarding exercises.
- [Jikan.moe](https://jikan.moe/)
  - Used to access MyAnimeList data.
- [MyAnimeList](https://myanimelist.net/)

  - Used for information regarding anime, manga, and anime/manga characters.

<img src="https://user-images.githubusercontent.com/56245555/76932527-79237380-692e-11ea-89d5-5729fae82f14.png" width="400px"><img src="https://user-images.githubusercontent.com/56245555/76932649-c273c300-692e-11ea-8ca6-dd927089db9b.png" width="400px">

# Setup Instructions

Please clone it or download it, and open your command line, change your current directory to this backend system directory. After that, please do commands below.

### 1. Install dependencies

- yarn

### 2. Install bundler and refresh your ruby environment

- gem install bundler
- rbenv rehash

### 3. Install dependencies for Ruby on Rails environment

- bundle install

### 4. Create database environment

And you have to prepare your DB environment on your computer, after you finish preparing, you have to create `.env` that includes your db setting like below.

・RAILS_MAX_THREADS  
・DATABASE_USER  
・DATABASE_PASSWORD  
・DATABASE_HOST  
・DATABASE_NAME_DEVELOPMENT  
・DATABASE_NAME_TEST  
・DATABASE_NAME

Create schema for this app on your RDBMS, and do commands below.

- rails db:migrate
- rails db:seed

### 5. Start server

- rails server

# Introducing the Team

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
