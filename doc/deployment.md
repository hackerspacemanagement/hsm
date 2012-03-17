Deploying HSM
=============

HSM is a standard rails application, for the most part. The current
recommended deployment is to Heroku, you should read the documentation on
deploying to heroku, first. It's pretty standard stuff, and you should figure
that one out yourself, frankly.

There are a few gotchas, however

Plugins
-------
By default, HSM is pretty barren, there's not really anything but "Users", and
they don't have membership or anything like that. All of that is handled by
plugins which are just standard [Rails engines](http://edgeapi.rubyonrails.org/classes/Rails/Engine.html).

There are a handful of small things to keep in mind, but it's really pretty
simple. Just add the plugin to your Gemfile and run some commands as outlined
in the Plugin's README (for example):

```@ruby
gem 'hsm_tools', :source => "https://github.com/rrix/hsm_tools"
```

Run:

```@bash
$ bundle
$ rails g hsm_tools:install
$ rake db:migrate
```

The canonical repository for HSM plugins would be at [our github 
page](https://github.com/hackerspacemanagement), but feel free to develop your
own awesome plugins! We will have a loose plugin documentation API
forthcoming.
