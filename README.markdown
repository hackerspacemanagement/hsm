Hackerspace Management
=========

This code is based on Rails 3.1.3

Prerequisites
-------------
* bundler

Production Environment
----------------------
    $ git clone git@github.com:rrix/hsm.git
    $ cd hsm
    $ bundle install
    $ rake db:seed

Development / Test Environment
------------------------------
    $ git clone git@github.com:rrix/hsm.git
    $ cd hsm
    $ bundle install --without production staging ci
    $ rake db:seed

Tests
-----

Tests are written using factory girl, rspec, and capybara. Factories are located in **spec/factories.rb**. Model specs are located in **spec/models**. Integration specs are in **spec/requests**.

To run the test suite:

    $ bundle exec rspec spec/

