Heatsync Labs - Hackerspace Management
=========

This code is based on Rails 3.1.0

Prerequisites
-------------
* bundler

Production Environment
----------------------
    $ git clone git@github.com:bowerman4875/hsm.git
    $ cd hsm
    $ bundle install
    $ rake db:seed

Development / Test Environment
------------------------------
    $ git clone git@github.com:bowerman4875/hsm.git
    $ cd hsm
    $ bundle install --without production staging ci
    $ rake db:seed

Tests
-----

Tests are written using factory girl, rspec, and capybara. Factories are located in **spec/factories.rb**. Model specs are located in **spec/models**. Integration specs are in **spec/requests**.

To run the test suite:

    $ bundle exec rspec spec/

To get code coverage (and run the test suite as well)

    $ rake cover_me:all

Deployment
----------

*staging*

The staging server is hosted by heroku

    $ git push heroku # => deploy latest code
