#Intro

Holla is a group chat app. The UI is built in a RIA fashion - i.e. is totally asynchronous and super fast. I've open sourced it for a book I'm writing on building Rich Internet Applications with JavaScript.

A WebKit based browser (Safari/Chrome) is required due to specific CSS optimizations. 

# randx fork

I've made some changes to make it more usable. My patch store all coversation in db - not in memory.

![Screenshot](https://lh4.googleusercontent.com/_IH1OempnqUc/TZF1gMnidmI/AAAAAAAABKE/b9rp9RdtA3o/s800/Screen%20shot%202011-03-29%20at%2018.58.12.png)

# Prerequisites

* Ruby 1.9.2
* Bundler
* Redis
* Nodejs

# Installation

* setup nodejs, juggernaut
* bundle install
* rake db:migrate
* bundle exec foreman start -p 3000

Now go to [http://localhost:3000](http://localhost:3000)
